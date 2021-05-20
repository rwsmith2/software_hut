# == Schema Information
#
# Table name: answers
#
#  additional_response :string
#  answer_text         :string           not null
#  comment_needed      :boolean
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

  #Returns the answer object, given the answer_id
  def self.get_answer(answer_id)
    answer = Answer.find(answer_id)
    return answer
  end

  #Given answer_id, returns what is needed of the vendor to complete the question
  def self.what_is_needed(answer_id)
    answer = Answer.find(answer_id)
    if(answer.comment_needed && answer.upload_needed)
      return ("An upload and a comment is required for this question.")
    elsif(answer.comment_needed)
      return("A comment is required for this question.")
    elsif(answer.upload_needed)
      return("An upload is required for this question.")
    end
    #If nothing is needed, return false
    return false
  end
  
end
