require 'rails_helper'

describe 'Admin assessment management' do

  specify 'I can create a new assessment' do
    user_admin = User.create(email: "domin@gmail.com", password: "password", user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user_admin.user_id)

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Assessments'

    click_link 'Create'

    fill_in 'Assessment Name', with: 'Test Assessment'
    fill_in 'Insert Question', with: 'Test Question'
    fill_in 'Insert Answer', with: 'Test Answer1'
    click_link 'Add Answer'
    fill_in 'Insert Answer', with: 'Test Answer2'
    click_button 'Save!'

    expect(page).to have_content 'Test Assessment'
  end

  specify 'I can edit a assessment', js: true do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Assessments'

    click_link 'Assessment 1'
    wait_for_ajax
    click_link 'Edit'

    fill_in 'Assessment Name', with: 'Test Assessment'
    fill_in 'Insert Question', with: 'Test Question'
    click_button 'Save!'

    expect(page).to have_content 'Test Assessment'

    click_link 'Test Assessment'
    wait_for_ajax
    expect(page).to have_content 'Test Question'
  end

  specify 'I can delete a assessment', js: true do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Assessments'

    click_link 'Assessment 1'
    wait_for_ajax
    
    accept_alert do
      click_link 'Destroy'
    end

    expect(page).to have_no_content 'Assessment 1'
    expect(page).to have_content 'Assessment 2'
  end

  def make_test_data
    # admin user
    user_admin = User.create(email: "domin@gmail.com", password: "password", user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user_admin.user_id)
    
    # assessments
    assessment1 = Assessment.new(assessment_title: "Assessment 1")
    assessment1.save(:validate => false)
    assessment2 = Assessment.new(assessment_title: "Assessment 2")
    assessment2.save(:validate => false)

    # questions
    question1 = Question.new(question_text: "Question 1", assessment_id: assessment1.assessment_id)
    question1.save(:validate => false)

    question2 = Question.new(question_text: "Question 2", assessment_id: assessment1.assessment_id)
    question2.save(:validate => false)

    question3 = Question.new(question_text: "Question 3", assessment_id: assessment2.assessment_id)
    question3.save(:validate => false)
    
    # answers
    Answer.create(answer_text: "Yes", question_id: question1.question_id)
    Answer.create(answer_text: "No", question_id: question1.question_id)
    
    Answer.create(answer_text: "Yes", question_id: question2.question_id)
    Answer.create(answer_text: "No", question_id: question2.question_id)

    Answer.create(answer_text: "Yes", question_id: question3.question_id)
    Answer.create(answer_text: "No", question_id: question3.question_id)
  end

end