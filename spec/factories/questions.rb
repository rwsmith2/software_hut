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
#  assessment_id  (assessment_id => assessments.assessment_id)
#
FactoryBot.define do
  factory :question do
    
  end
end
