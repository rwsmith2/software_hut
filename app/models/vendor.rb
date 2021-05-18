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
  belongs_to :user, foreign_key: :user_id, dependent: :destroy

  validates :company_name, presence: true
  validates :company_number, presence: true

  def self.get_vendor_name(vendor_id)
    vendor = Vendor.find_by(vendor_id: vendor_id)
    return vendor.company_name
  end

  def self.get_vendor_id(user_id)
    vendor = Vendor.find_by(user_id: user_id)
    return vendor.vendor_id
  end

end
