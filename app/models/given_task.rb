# == Schema Information
#
# Table name: given_tasks
#
#  due_date      :date             not null
#  priority      :integer
#  repeatable    :integer          not null
#  set_date      :date             not null
#  given_task_id :integer          not null, primary key
#  task_id       :bigint
#
# Indexes
#
#  index_given_tasks_on_task_id  (task_id)
#
# Foreign Keys
#
#  fk_rails_...  (task_id => tasks.task_id) ON DELETE => cascade
#
class GivenTask < ApplicationRecord
  belongs_to :task
  has_many :assignments,  dependent: :destroy
  accepts_nested_attributes_for :assignments, allow_destroy: true

  validates :due_date, :repeatable, :priority, presence: true

  #Takes int input and returns the string version(because its stored as int in the db)
  def self.priority_int_to_string(integer_input)
    case integer_input
    when 1
      return "Low"
    when 3
      return "High"
    else
      return "Medium"
    end
  end

  #Takes string input and returns the int version(because its stored as int in the db)
  def self.priority_string_to_int(string_input)
    case string_input
    when "Low"
      return 1
    when "High"
      return 3
    else 
      return 2
    end
  end

  #Takes the repeatable input from form and checks if its empty
  def self.if_empty_repeatable_set_to_0(repeatable_input)
    if(repeatable_input=="")
      return 0
    end
    return repeatable_input
  end


end
