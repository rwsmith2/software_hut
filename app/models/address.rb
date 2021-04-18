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
#  vendor_id  (vendor_id => vendors.vendor_id) ON DELETE => cascade
#
class Address < ApplicationRecord
end
