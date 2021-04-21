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
require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
