# == Schema Information
#
# Table name: answers
#
#  additional_response :string
#  answer_text         :string           not null
#  upload_needed       :boolean          default(FALSE)
#  answer_id           :integer          not null, primary key
#  question_id         :integer
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.question_id) ON DELETE => cascade
#
require 'rails_helper'

RSpec.describe Answer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  assesment = Assessment.create(assessment_title: "Triage questions")
  question = Question.create(question_text: "Are you eligible of ..?", assessment_id: assesment.assessment_id)
  answer = Answer.create(additional_response: "Good",answer_text: "Yes", question_id: question.question_id)
  VendorAnswer.create(id:123,answer_id: answer.answer_id, assignment_id: assesment.assessment_id)
  
  describe "#answer_text" do
    it 'can retrieve answer_text' do
      expect(answer.answer_text).to eq "Yes"
    end
  end

  describe "#additional_response" do
    it 'can retrieve additional_response' do
      expect(answer.additional_response).to eq "Good"
    end
  end

  describe "#upload_needed" do
    it 'can retrieve upload_needed' do
      expect(answer.upload_needed).to eq FALSE
    end
  end
  
  describe "#answer_id" do
    it 'has an answer_id' do
      expect(answer.answer_id).to eq answer.answer_id
    end
  end

  describe "#question_id" do
    it 'has an question_id' do
      expect(answer.question_id).to eq answer.question_id
    end

    it 'can retrieve an question_id' do
      expect(answer.question_id).to eq question.question_id
    end
  end
end
