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
class Answer < ApplicationRecord
  belongs_to :question, optional: true
  has_many :vendor_answers

  validates :answer_text, presence: true, length: { in: 2..100}

  def self.get_answer(answer_id)
    answer = Answer.find(answer_id)
    return answer
  end
end
