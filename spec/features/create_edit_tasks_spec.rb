require 'rails_helper'

describe 'Create/Edit tasks' do

  specify 'I can navigate to the task management page' do
    # Admin User
    user1 = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user1.user_id)

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'
    expect(page).to have_content 'New Task'
  end

  specify 'I can create a new task' do
    # Admin User
    user1 = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user1.user_id)

    assessment = Assessment.new(assessment_title: "Assessment questions")
    assessment.save(:validate => false)
    
    question = Question.new(question_text: "Are you eligible of ..?", assessment_id: assessment.assessment_id)
    question.save(:validate => false)
    
    answer1 = Answer.create(answer_text: "Yes", question_id: question.question_id)
    answer2 = Answer.create(answer_text: "No", question_id: question.question_id)
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'
    fill_in 'task_task_title', with: 'Task00'
    fill_in 'task_task_description', with: 'it is a good task'
    fill_in 'task_estimation', with: '10'
    select 'Assessment questions', from: 'task_assessment_linker_attributes_assessment_id'
    click_button 'Create!'
    expect(page).to have_content 'Task00'
  end

  # js required
  specify 'I can edit a task', :js => true do
    # Admin User
    user1 = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user1.user_id)

    assessment = Assessment.new(assessment_title: "Assessment questions")
    assessment.save(:validate => false)
    
    question = Question.new(question_text: "Are you eligible of ..?", assessment_id: assessment.assessment_id)
    question.save(:validate => false)
    
    answer1 = Answer.create(answer_text: "Yes", question_id: question.question_id)
    answer2 = Answer.create(answer_text: "No", question_id: question.question_id)
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'
    fill_in 'task_task_title', with: 'Task00'
    fill_in 'task_task_description', with: 'it is a good task'
    fill_in 'task_estimation', with: '10'
    select 'Assessment questions', from: 'task_assessment_linker_attributes_assessment_id'
    click_button 'Create!'
    click_link 'Task00'
    click_link 'Edit'
    sleep(1)
    modal = find("#modalWindow")
    modal.fill_in 'Description', with: 'A great task'
    modal.click_button 'Update Task'
    sleep(1)
    click_link 'Task00'
    expect(page).to have_content 'A great task'

  end

  # js required
  specify 'I can delete a task', :js => true do
    # Admin User
    user1 = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user1.user_id)

    assessment = Assessment.new(assessment_title: "Assessment questions")
    assessment.save(:validate => false)
    
    question = Question.new(question_text: "Are you eligible of ..?", assessment_id: assessment.assessment_id)
    question.save(:validate => false)
    
    answer1 = Answer.create(answer_text: "Yes", question_id: question.question_id)
    answer2 = Answer.create(answer_text: "No", question_id: question.question_id)
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'
    fill_in 'task_task_title', with: 'Task00'
    fill_in 'task_task_description', with: 'it is a good task'
    fill_in 'task_estimation', with: '10'
    select 'Assessment questions', from: 'task_assessment_linker_attributes_assessment_id'
    click_button 'Create!'
    click_link 'Task00'
    accept_alert do
      click_link 'Destroy'
    end

  end

end