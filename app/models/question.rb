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
class Question < ApplicationRecord
end
