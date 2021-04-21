# == Schema Information
#
# Table name: vendor_uploads
#
#  id            :integer          not null, primary key
#  data          :binary
#  assignment_id :integer
#  upload_id     :integer
#
# Foreign Keys
#
#  assignment_id  (assignment_id => assignments.assignment_id) ON DELETE => cascade
#  upload_id      (upload_id => uploads.upload_id)
#
class VendorUpload < ApplicationRecord
  belongs_to :assignments,  dependent: :destroy
  has_one_attached :image
end
