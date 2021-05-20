require 'rails_helper'

describe 'Admin assessment review' do

  # could
  specify 'I can navigate to the task review page from homepage', :js => true do
    user1 = User.create(email: "domin@gmail.com", password: "password", user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user1.user_id)

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Vendors'
    expect(page).to have_content 'Vendor Management'
  end

  # could
  specify 'I can review vendor assessments', :js => true do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Vendors'
    click_link 'Edit/View'
    click_link 'Example Task 1'
    expect(page).to have_content 'Are you eligible of ..?'
    expect(page).to have_content 'Yes'
  end

  specify 'I can review vendor assessments with files', skip: 'Not implemented' do

  end

  def make_test_data
    # admin
    user_admin = User.create(email: "domin@gmail.com", password: "password", user_name: "domin@gmail.com", is_admin: true)
    Admin.create(user_id: user_admin.user_id)

    # vendor
    user = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor = Vendor.create(user_id: user.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
    address = Address.create(vendor_id: vendor.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

    # task
    task = Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1")
    given_task = GivenTask.create(set_date: "2021-04-25", due_date: "2021-05-01",priority: "2",repeatable: "7", task_id: task.task_id)
    
    # assessment
    assessment = Assessment.new(assessment_title: "Assessment questions")
    assessment.save(:validate => false)
    assessment_linker = AssessmentLinker.create(task_id: task.task_id, assessment_id: assessment.assessment_id)
    
    # question
    question = Question.new(question_text: "Are you eligible of ..?", assessment_id: assessment.assessment_id)
    question.save(:validate => false)
    
    # answer
    answer1 = Answer.create(answer_text: "Yes", question_id: question.question_id)
    answer2 = Answer.create(answer_text: "No", question_id: question.question_id)

    # assign
    assignment = Assignment.create(complete: "true",vendor_id: vendor.vendor_id, given_task_id: given_task.given_task_id, complete_by: "2021-05-01")
    
    # vendor answer
    VendorAnswer.create(assignment_id: assignment.assignment_id, answer_id: answer1.answer_id)
  end
end