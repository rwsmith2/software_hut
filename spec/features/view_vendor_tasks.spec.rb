require 'rails_helper'

describe 'View vendors tasks as a vendor' do

  specify 'I can view a list of tasks that have been assigned to me on dashboard' do
    # Vendor User
    user = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor = Vendor.create(user_id: user.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
    address = Address.create(vendor_id: vendor.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

    task = Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: user.user_id)
    
    given_task = GivenTask.create(set_date: "2021-04-25", due_date: "2021-05-01",priority: "2",repeatable: "7", task_id: task.task_id)
    
    assessment = Assessment.new(assessment_title: "Assessment questions")
    assessment.save(:validate => false)
    
    assignment = Assignment.create(vendor_id: vendor.vendor_id, given_task_id: given_task.given_task_id)
    
    assessment_linker = AssessmentLinker.create(task_id: task.task_id, assessment_id: assessment.assessment_id)
    
    question = Question.new(question_text: "Are you eligible of ..?", assessment_id: assessment.assessment_id)
    question.save(:validate => false)
    
    answer1 = Answer.create(answer_text: "Yes", question_id: question.question_id)
    answer2 = Answer.create(answer_text: "No", question_id: question.question_id)
    

    
    visit '/users/sign_in'
    fill_in 'Email', with: 'mmq1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Example Task 1'
  end

  specify 'I can view details of a assignment' do
    # Vendor User
    user = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor = Vendor.create(user_id: user.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
    address = Address.create(vendor_id: vendor.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

    task = Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: user.user_id)
    
    given_task = GivenTask.create(set_date: "2021-04-25", due_date: "2021-05-01",priority: "2",repeatable: "7", task_id: task.task_id)
    
    assessment = Assessment.new(assessment_title: "Assessment questions")
    assessment.save(:validate => false)
    
    assignment = Assignment.create(vendor_id: vendor.vendor_id, given_task_id: given_task.given_task_id)
    
    assessment_linker = AssessmentLinker.create(task_id: task.task_id, assessment_id: assessment.assessment_id)
    
    question = Question.new(question_text: "Are you eligible of ..?", assessment_id: assessment.assessment_id)
    question.save(:validate => false)
    
    answer1 = Answer.create(answer_text: "Yes", question_id: question.question_id)
    answer2 = Answer.create(answer_text: "No", question_id: question.question_id)
        
    visit '/users/sign_in'
    fill_in 'Email', with: 'mmq1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'A nice Task'
  end

  # should
  specify 'I can sort the tasks on my task list by order of due date', :js => true do

  end

end