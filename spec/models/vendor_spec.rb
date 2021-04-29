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
require 'rails_helper'

RSpec.describe Vendor, type: :model do  
  # pending "add some examples to (or delete) #{__FILE__}"
  user = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
  vendor = Vendor.create(user_id: user.user_id, company_name: "MM Quality", company_number: "1455", validated: true)

  describe "#company_name" do
    it 'can retrieve company_name' do
      expect(vendor.company_name).to eq "MM Quality"
    end
  end

  describe "#company_number" do
    it 'can retrieve company_number' do
      expect(vendor.company_number).to eq 1455
    end
  end

  describe "#credit_rating" do
    it 'has credit_rating' do
      expect(vendor.credit_rating).to satisfy { |value| value == NIL || value.is_a?(Numeric) }
    end
  end

  describe "#kpi" do
    it 'has kpi' do
      expect(vendor.kpi).to satisfy { |value| value == NIL || value.is_a?(Numeric) } 
    end
  end

  describe "#risk_rating" do
    it 'has risk_rating' do
      expect(vendor.risk_rating).to satisfy { |value| value == NIL || value.is_a?(Numeric) } 
    end
  end

  describe "#validated" do
    it 'has validated' do
      expect(vendor.validated).to eq TRUE
    end
  end

  describe "#user_id" do
    it 'can retrieve user_id' do
      expect(vendor.user_id).to eq user.user_id
    end
  end

  describe "#vendor_id" do
    it 'has vendor_id' do
      expect(vendor.vendor_id).to eq vendor.vendor_id
    end
  end
end
