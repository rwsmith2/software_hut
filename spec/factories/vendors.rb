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
FactoryBot.define do
  factory :vendor do
    
  end
end
