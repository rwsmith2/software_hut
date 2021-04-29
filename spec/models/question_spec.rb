# == Schema Information
#
# Table name: questions
#
#  question_text :string           not null
#  assessment_id :integer
#  question_id   :integer          not null, primary key
#
# Foreign Keys
#
#  fk_rails_...  (assessment_id => assessments.assessment_id)
#
require 'rails_helper'


RSpec.describe Question, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  assesment = Assessment.create(assessment_title: "Triage questions")
  question = Question.create(question_text: "Are you eligible of ..?", assessment_id: assesment.assessment_id)
  Answer.create(answer_text: "Yes", question_id: question.question_id)

  describe "#question_text" do
    it 'can retrieve question_text' do
      expect(question.question_text).to eq "Are you eligible of ..?"
    end
  end

  describe "#assessment_id" do
    it 'has an assessment_id' do
      expect(question.assessment_id).to eq assesment.assessment_id
    end
  end

  describe "#question_id" do
    it 'has an question_id' do
      expect(question.question_id).to eq question.question_id
    end
  end
end
