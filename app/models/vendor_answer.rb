
# == Schema Information
#
# Table name: vendor_answers
#
#  id            :bigint           not null, primary key
#  vendor_upload :binary
#  answer_id     :integer
#  assignment_id :integer
#
# Foreign Keys
#
#  fk_rails_...  (answer_id => answers.answer_id)
#  fk_rails_...  (assignment_id => assignments.assignment_id) ON DELETE => cascade
#
class VendorAnswer < ApplicationRecord
  has_one_attached :document
  belongs_to :assignment
  belongs_to :answer

  validates :document, presence: true, if: :required_upload?

  def self.get_answer_data(answer_id)
    answer_data = Answer.joins(:question).where("answer_id=?", answer_id)
    return answer_data
  end

  def self.get_question_data(question_id)
    question_data = Question.where("question_id=?", question_id)
    return question_data
  end

  def required_upload?
    puts(self.inspect)
    Answer.find(self.answer_id).upload_needed
  end



end

