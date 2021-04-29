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
  # pending "add some examples to (or delete) #{__FILE__}"
  assesment = Assessment.create(assessment_title: "Triage questions")
  question = Question.create(question_text: "Are you eligible of ..?", assessment_id: assesment.assessment_id)
  answer = Answer.create(answer_text: "Yes", question_id: question.question_id)

  upload = Upload.create(upload_description:"uploaded", upload_type:1, answer_id:answer.answer_id)

  describe "#upload_description" do
    it 'can retrieve upload_description' do
      expect(upload.upload_description).to  eq "uploaded"
    end
  end

  describe "#upload_type" do
    it 'can retrieve upload_type' do
      expect(upload.upload_type).to eq 1
    end
  end

  describe "#answer_id" do
    it 'can retrieve answer_id' do
      expect(upload.answer_id).to eq answer.answer_id
    end
  end

  describe "#upload_id" do
    it 'has an upload_id' do
      expect(upload.upload_id).to eq upload.upload_id
    end
  end
end
