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
require 'rails_helper'

RSpec.describe Address, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  user = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
  vendor = Vendor.create(user_id: user.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
  address = Address.create(vendor_id: vendor.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")
  
  describe "#city_town" do
    it 'can retrieve string' do
      # address = Address.new(city_town:"London")
      expect(address.city_town).to eq "Sheffield"
    end
  end

  describe "#country" do
    it 'can retrieve string' do
      # address = Address.new(country:"UK")
      expect(address.country).to eq "Sheffield"
    end
  end

  describe "#house_name" do
    it 'can retrieve string' do
      # address = Address.new(house_name:"diamond")
      expect(address.house_name).to eq "67"
    end
  end

  describe "#postcode" do
    it 'can retrieve string' do
      # address = Address.new(postcode:"S3 7RD")
      expect(address.postcode).to eq "S1 CBQ"
    end
  end
  
end
