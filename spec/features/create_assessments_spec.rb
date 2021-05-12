require 'rails_helper'

describe 'Create assessments' do
  # could
  specify 'I upload a new assessment by a csv file' do
    # Vendor User
    user = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor = Vendor.create(user_id: user.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
    address = Address.create(vendor_id: vendor.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

    assessment = Assessment.create(assessment_title: "Assessment questions")
    question = Question.create(question_text: "Are you eligible of ..?", assessment_id: assessment.assessment_id)
    Answer.create(answer_text: "Yes", question_id: question.question_id)
    
    task = Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: user.user_id)
    AssessmentLinker.create(task_id: task.task_id, assessment_id: assessment.assessment_id)
  end

end