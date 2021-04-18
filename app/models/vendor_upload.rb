# == Schema Information
#
# Table name: vendor_uploads
#
#  id            :bigint           not null, primary key
#  data          :binary
#  assignment_id :integer
#  upload_id     :integer
#
# Foreign Keys
#
#  fk_rails_...  (assignment_id => assignments.assignment_id) ON DELETE => cascade
#  fk_rails_...  (upload_id => uploads.upload_id)
#
class VendorUploads < ApplicationRecord
  belongs_to :assignments,  dependent: :destroy

end
