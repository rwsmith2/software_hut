class Assignment < ApplicationRecord
  has_many :vendor_answers,  dependent: :destroy
  has_many :vendor_uploads,  dependent: :destroy
  belongs_to :given_task
  belongs_to :vendor

  
end
