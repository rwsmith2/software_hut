
# == Schema Information
#
# Table name: vendor_answers
#
#  id            :bigint           not null, primary key
#  vendor_upload :binary
#  answer_id     :integer
#  assignment_id :integer
#
# Foreign Keys
#
#  fk_rails_...  (answer_id => answers.answer_id)
#  fk_rails_...  (assignment_id => assignments.assignment_id) ON DELETE => cascade
#
class VendorAnswer < ApplicationRecord
  belongs_to :assignment
  belongs_to :answer
end

