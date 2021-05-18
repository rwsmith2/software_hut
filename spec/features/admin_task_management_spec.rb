require 'rails_helper'

describe 'Admin task management' do

  specify 'I can navigate to the task management page' do
    user_admin = User.create(email: "domin@gmail.com", password: "password", user_name: "domin@gmail.com", is_admin: true)
    Admin.create(user_id: user_admin.user_id)

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'
    expect(page).to have_content 'New Task'
  end

  specify 'I can create a new task' do
    user_admin = User.create(email: "domin@gmail.com", password: "password", user_name: "domin@gmail.com", is_admin: true)
    Admin.create(user_id: user_admin.user_id)

    assessment = Assessment.new(assessment_title: "Assessment questions")
    assessment.save(:validate => false)
    
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
    make_test_data
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'
    click_link 'Example Task 1'
    click_link 'Edit'
    wait_for_ajax

    modal = find("#modalWindow")
    modal.fill_in 'Description', with: 'A great task'
    modal.click_button 'Update Task'
    wait_for_ajax

    click_link 'Example Task 1'
    expect(page).to have_content 'A great task'
  end

  # js required
  specify 'I can delete a task', :js => true do
    make_test_data
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'
    click_link 'Example Task 1'
    accept_alert do
      click_link 'Destroy'
    end

    expect(page).to have_no_content 'Example Task 1'
    expect(page).to have_content 'Example Task 2'
  end

  specify 'I can assign a task to a vendor', :js => true do
    make_test_data_without_assign
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    click_link 'Tasks'

    click_link 'Example Task 1'
    click_link 'Assign'
    wait_for_ajax

    modal = find("#modalWindow")
    modal.fill_in 'given_task_due_date', with: '25-12-2021'
    modal.fill_in 'given_task_repeatable', with: '0'
    modal.select 'Low', from: 'given_task_priority'
    modal.select 'MM Quality', from: 'given_task_assignments_attributes_0_vendor_id'
    modal.click_button 'Assign Tasks'
    wait_for_ajax

    click_link 'Given Tasks Page'
    expect(page).to have_content 'Example Task 1'
  end

  specify 'I can assign repeatable chaser tasks, which repeat yearly/quarterly/etc', :js => true do
    make_test_data_without_assign
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    click_link 'Tasks'

    click_link 'Example Task 1'
    click_link 'Assign'
    wait_for_ajax

    modal = find("#modalWindow")
    modal.fill_in 'given_task_due_date', with: '25-12-2021'
    modal.fill_in 'given_task_repeatable', with: '5'
    modal.select 'Low', from: 'given_task_priority'
    modal.select 'MM Quality', from: 'given_task_assignments_attributes_0_vendor_id'
    modal.click_button 'Assign Tasks'
    wait_for_ajax

    click_link 'Given Tasks Page'
    click_link '1 - Example Task 1'
    expect(page).to have_content 'Repeats every 5 days'
  end

  specify 'I can assign a task to multiple vendors', :js => true do
    make_test_data_without_assign
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    click_link 'Tasks'

    click_link 'Example Task 1'
    click_link 'Assign'
    wait_for_ajax

    modal = find("#modalWindow")
    modal.fill_in 'given_task_due_date', with: '25-12-2021'
    modal.fill_in 'given_task_repeatable', with: '0'
    modal.select 'Low', from: 'given_task_priority'
    modal.select 'MM Quality', from: 'given_task_assignments_attributes_0_vendor_id'
    modal.click_link 'Add Vendor'
    sec_sel = find("#vendors > div.card-body.overflow-auto > div:nth-child(2) > div > select")
    sec_sel.select 'Dairy prod'
    modal.click_button 'Assign Tasks'
    wait_for_ajax

    click_link 'Given Tasks Page'
    expect(page).to have_content '2 vendors assigned'
  end

  def make_test_data_without_assign
    # admin user
    user_admin = User.create(email: "domin@gmail.com", password: "password", user_name: "domin@gmail.com", is_admin: true)
    Admin.create(user_id: user_admin.user_id)

    # vendor user
    user_vendor = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor = Vendor.create(user_id: user_vendor.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
    address = Address.create(vendor_id: vendor.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

    user_vendor2 = User.create(email: "dairy@gmail.com", password: "password", user_name: "dairy@gmail.com", is_admin: false)
    vendor2 = Vendor.create(user_id: user_vendor2.user_id, company_name: "Dairy prod", company_number: "121", validated: true)
    address2 = Address.create(vendor_id: vendor2.vendor_id, city_town: "Cambridge", country: "UK", house_name: "Store 51", postcode: "C1 4LS")
    
    # task
    task1 = Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: user_admin.user_id)
    task2 = Task.create(task_title: "Example Task 2", task_description: "A good Task", estimation: "1", user_id: user_admin.user_id)

    # assessment
    assessment = Assessment.new(assessment_title: "Assessment questions")
    assessment.save(:validate => false)
    assessment_linker = AssessmentLinker.create(task_id: task1.task_id, assessment_id: assessment.assessment_id)
    assessment_linker = AssessmentLinker.create(task_id: task2.task_id, assessment_id: assessment.assessment_id)
  end

  def make_test_data
    # admin user
    user_admin = User.create(email: "domin@gmail.com", password: "password", user_name: "domin@gmail.com", is_admin: true)
    Admin.create(user_id: user_admin.user_id)

    # vendor user
    user_vendor = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor = Vendor.create(user_id: user_vendor.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
    address = Address.create(vendor_id: vendor.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

    user_vendor2 = User.create(email: "dairy@gmail.com", password: "password", user_name: "dairy@gmail.com", is_admin: false)
    vendor2 = Vendor.create(user_id: user_vendor2.user_id, company_name: "Dairy prod", company_number: "121", validated: true)
    address2 = Address.create(vendor_id: vendor2.vendor_id, city_town: "Cambridge", country: "UK", house_name: "Store 51", postcode: "C1 4LS")
    
    # task
    task1 = Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: user_admin.user_id)
    task2 = Task.create(task_title: "Example Task 2", task_description: "A good Task", estimation: "1", user_id: user_admin.user_id)
    given_task1 = GivenTask.create(set_date: "2021-04-25", due_date: "2021-05-01", priority: "2", repeatable: "7", task_id: task1.task_id)
    given_task2 = GivenTask.create(set_date: "2021-04-25", due_date: "2021-05-01", priority: "2", repeatable: "7", task_id: task2.task_id)

    # assessment
    assessment = Assessment.new(assessment_title: "Assessment questions")
    assessment.save(:validate => false)
    assessment_linker = AssessmentLinker.create(task_id: task1.task_id, assessment_id: assessment.assessment_id)
    assessment_linker = AssessmentLinker.create(task_id: task2.task_id, assessment_id: assessment.assessment_id)
    
    # assign
    assignment = Assignment.create(vendor_id: vendor.vendor_id, given_task_id: given_task1.given_task_id)
    assignment = Assignment.create(vendor_id: vendor.vendor_id, given_task_id: given_task2.given_task_id)
  end

end