class VendorAnswers < ApplicationRecord
  belongs_to :assignments,  dependent: :destroy

end
