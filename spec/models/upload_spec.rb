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
#  fk_rails_...  (answer_id => answers.answer_id) ON DELETE => cascade
#
require 'rails_helper'

RSpec.describe Upload, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
