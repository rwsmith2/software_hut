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
FactoryBot.define do
  factory :answer do
    
  end
end
