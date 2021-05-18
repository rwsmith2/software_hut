require 'rails_helper'

describe 'Admin task view' do

  specify 'I can navigate to the task list page from homepage as an admin' do
    user1 = User.create(email: "domin@gmail.com", password: "password", user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user1.user_id)

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'
    expect(page).to have_content 'New Task'
  end

  specify 'I can see a list of tasks' do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'

    expect(page).to have_content 'Example Task 1'
  end

  specify 'I can view details of a task', :js => true do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'

    click_link 'Example Task 1'

    expect(page).to have_content 'A nice Task'
  end

  specify 'I search for a task', :js => true do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'

    expect(page).to have_content 'Example Task 1'
    expect(page).to have_content 'Example Task 2'

    fill_in 'Task name', with: 'Example Task 1'
    click_button 'Search'

    expect(page).to have_content 'Example Task 1'
    expect(page).to have_no_content 'Example Task 2'
  end

  def make_test_data
    # admin user
    user_admin = User.create(email: "domin@gmail.com", password: "password", user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user_admin.user_id)
    
    # task
    task1 = Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: user_admin.user_id)
    task2 = Task.create(task_title: "Example Task 2", task_description: "A good Task", estimation: "1", user_id: user_admin.user_id)

    # assessment
    assessment = Assessment.new(assessment_title: "Assessment questions")
    assessment.save(:validate => false)
    assessment_linker = AssessmentLinker.create(task_id: task1.task_id, assessment_id: assessment.assessment_id)
    assessment_linker = AssessmentLinker.create(task_id: task2.task_id, assessment_id: assessment.assessment_id)
  end

end