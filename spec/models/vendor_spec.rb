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
#  vendor_id      :integer          not null, primary key
#
require 'rails_helper'

RSpec.describe Vendor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
