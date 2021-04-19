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
FactoryBot.define do
  factory :given_task do
    
  end
end
