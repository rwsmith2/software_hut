# == Schema Information
#
# Table name: vendors
#
#  company_name   :string           not null
#  company_number :integer          not null
#  credit_rating  :integer
#  initial_score  :integer
#  kpi            :integer
#  risk_rating    :integer
#  validated      :boolean          default(FALSE)
#  user_id        :integer
#  vendor_id      :integer          not null, primary key
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.user_id) ON DELETE => cascade
#
class Vendor < ApplicationRecord
    has_one :address, dependent: :destroy
    has_many :assignments,  dependent: :destroy
    has_one :user, foreign_key: :user_id, dependent: :destroy


end
