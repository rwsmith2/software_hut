class GivenTask < ApplicationRecord
    has_one :tasks
    has_many :vendor_answers
    has_many :vendor_uploads
end
