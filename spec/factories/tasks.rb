# == Schema Information
#
# Table name: tasks
#
#  estimation       :integer          not null
#  task_description :string
#  task_title       :string           not null
#  upload_type      :integer          not null
#  admin_id         :integer
#  task_id          :integer          not null, primary key
#
# Foreign Keys
#
#  fk_rails_...  (admin_id => admins.admin_id)
#
FactoryBot.define do
  factory :task do
    
  end
end
