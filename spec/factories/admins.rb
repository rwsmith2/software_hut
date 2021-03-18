# == Schema Information
#
# Table name: admins
#
#  admin_id :integer          not null, primary key
#  user_id  :integer
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.user_id) ON DELETE => cascade
#
FactoryBot.define do
  factory :admin do
    
  end
end
