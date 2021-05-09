# == Schema Information
#
# Table name: assessments
#
#  assessment_title :string           not null
#  assessment_id    :integer          not null, primary key
#
class Assessment < ApplicationRecord
  has_many :assessment_linker, dependent: :delete_all
  has_many :questions , dependent: :delete_all
  belongs_to :task, optional: true
  accepts_nested_attributes_for :questions, allow_destroy: true

  validates_associated :questions
  validates :assessment_title, presence: true, length: { in: 5..100}, uniqueness: { case_sensitive: false }
  validate :validate_question_count

  def validate_question_count 
    if self.questions.size < 1
      errors.add(:questions, "- Need 1 or more questions")
    end
  end


  
end
