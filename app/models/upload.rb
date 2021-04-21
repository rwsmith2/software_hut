# == Schema Information
#
# Table name: uploads
#
#  upload_description :string
#  upload_type        :integer
#  answer_id          :integer
#  upload_id          :integer          not null, primary key
#
# Foreign Keys
#
#  answer_id  (answer_id => answers.answer_id) ON DELETE => cascade
#
class Upload < ApplicationRecord
    has_one :answers
end
