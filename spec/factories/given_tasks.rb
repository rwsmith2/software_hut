# == Schema Information
#
# Table name: given_tasks
#
#  complete      :boolean          default(FALSE)
#  due_date      :date             not null
#  priority      :integer
#  repeatable    :integer          not null
#  set_date      :date             not null
#  given_task_id :integer          not null, primary key
#  task_id       :integer
#  vendor_id     :integer
#
# Foreign Keys
#
#  task_id    (task_id => tasks.task_id) ON DELETE => cascade
#  vendor_id  (vendor_id => vendors.vendor_id) ON DELETE => cascade
#
FactoryBot.define do
  factory :given_task do
    
  end
end
