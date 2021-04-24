# == Schema Information
#
# Table name: addresses
#
#  city_town  :string           not null
#  country    :string           not null
#  house_name :string           not null
#  postcode   :string           not null
#  vendor_id  :integer          not null, primary key
#
# Foreign Keys
#
#  fk_rails_...  (vendor_id => vendors.vendor_id) ON DELETE => cascade
#
FactoryBot.define do
  factory :address do
    
  end
end
