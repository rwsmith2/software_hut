# == Schema Information
#
# Table name: addresses
#
#  city_town  :string           not null
#  country    :string           not null
#  house_name :string           not null
#  postcode   :string           not null
#  vendor_id  :integer
#
# Foreign Keys
#
#  fk_rails_...  (vendor_id => vendors.vendor_id) ON DELETE => cascade
#
class Address < ApplicationRecord
  validates :city_town, presence: true
  validates :country, presence: true
  validates :house_name, presence: true
  validates :postcode, presence: true
end
