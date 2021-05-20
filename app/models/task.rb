# == Schema Information
#
# Table name: tasks
#
#  estimation       :integer          not null
#  task_description :string
#  task_title       :string           not null
#  task_id          :integer          not null, primary key
#
class Task < ApplicationRecord
  has_one :assessment_linker,  dependent: :destroy
  has_many :given_task, dependent: :destroy


  accepts_nested_attributes_for :assessment_linker, allow_destroy: true
  validates :task_title, :estimation, presence: true
  validates :task_title, length: { in: 5..100}, uniqueness: { case_sensitive: false }
  validates :estimation, numericality: { only_integer: true, greater_than: 0 }

  #Returns the task name, from task_id input
  def self.get_task_name(task_id)
    task_name = Task.find(task_id).task_title
    return task_name
  end

  #Returns the task description from task_id input
  def self.get_task_description(task_id)
    task_description = Task.find(task_id).task_description
    return task_description
  end

  #Returns the task estimation from task_id input
  def self.get_task_estimation(task_id)
    task_estimation = Task.find(task_id).estimation
    return task_estimation
  end

  #Repeats all of the tasks which need repeating on that day
  def self.repeat_tasks()
    #Get the current date
    today_date = Date.today
    @need_repeat_tasks = GivenTask.all
    #Loop through all given task objects
    @need_repeat_tasks.each do |given_task|
      #If the task needs repeating
      if given_task.repeatable > 0 && today_date >= (given_task.set_date + given_task.repeatable)
        old_due_date = given_task.due_date
        task_time_length = (given_task.due_date - given_task.set_date).to_i
        given_task.set_date = today_date
        given_task.due_date = today_date + task_time_length
        given_task.save
        vendors_assigned = Assignment.where(given_task_id: given_task.given_task_id, complete_by: old_due_date).select(:vendor_id).distinct
        #Create new assignments for all the vendors assigned
        vendors_assigned.each do |new_assign|
          assignment = Assignment.new
          assignment.vendor_id = new_assign.vendor_id
          assignment.complete_by = given_task.due_date
          assignment.given_task_id = given_task.given_task_id
          assignment.save
        end
      end
    end
  end

end
