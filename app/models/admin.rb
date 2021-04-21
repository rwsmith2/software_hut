# == Schema Information
#
# Table name: admins
#
#  admin_id :integer          not null, primary key
#  user_id  :integer
#
# Foreign Keys
#
#  user_id  (user_id => users.user_id) ON DELETE => cascade
#
class Admin < ApplicationRecord
  has_one :user, foreign_key: :user_id, dependent: :destroy
end
