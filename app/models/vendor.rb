# == Schema Information
#
# Table name: vendors
#
#  id             :bigint           not null, primary key
#  company_name   :string           not null
#  company_number :integer          not null
#  credit_rating  :integer
#  initial_score  :integer
#  kpi            :integer
#  risk_rating    :integer
#  validated      :boolean          default(FALSE)
#
class Vendor < ApplicationRecord
end
