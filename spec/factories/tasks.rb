# == Schema Information
#
# Table name: tasks
#
#  estimation       :integer          not null
#  task_description :string
#  task_title       :string           not null
#  task_id          :integer          not null, primary key
#  user_id          :integer
#
# Foreign Keys
#
#  user_id  (user_id => users.user_id)
#
FactoryBot.define do
  factory :task do
    
  end
end
