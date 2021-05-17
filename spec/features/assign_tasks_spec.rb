require 'rails_helper'

describe 'Assign tasks' do

  specify 'I can navigate to the task management page from homepage' do
    # Admin User
    user = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user.user_id)

    Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: user.user_id)

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'
    expect(page).to have_content 'New Task'
  end

  specify 'I can assign a task to a vendor', :js => true do
    # Admin User
    user = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user.user_id)

    Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: user.user_id)

    user = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor = Vendor.create(user_id: user.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
    address = Address.create(vendor_id: vendor.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'
    click_link 'Example Task 1'
    click_link 'Assign'
    sleep(1)
    modal = find("#modalWindow")
    modal.fill_in 'given_task_due_date', with: '25-12-2021'
    modal.fill_in 'given_task_repeatable', with: '0'
    modal.select 'Low', from: 'given_task_priority'
    modal.select 'MM Quality', from: 'given_task_assignments_attributes_0_vendor_id'
    modal.click_button 'Assign Tasks'
    sleep(1)
    click_link 'Given Tasks Page'
    expect(page).to have_content 'Example Task 1'
  end

  # should
  specify 'I can assign repeatable chaser tasks, which repeat yearly/quarterly/etc', :js => true do
    # Admin User
    user = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user.user_id)

    Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: user.user_id)

    user = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor = Vendor.create(user_id: user.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
    address = Address.create(vendor_id: vendor.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'
    click_link 'Example Task 1'
    click_link 'Assign'
    sleep(1)
    modal = find("#modalWindow")
    modal.fill_in 'given_task_due_date', with: '25-12-2021'
    modal.fill_in 'given_task_repeatable', with: '5'
    modal.select 'Low', from: 'given_task_priority'
    modal.select 'MM Quality', from: 'given_task_assignments_attributes_0_vendor_id'
    modal.click_button 'Assign Tasks'
    sleep(1)
    click_link 'Given Tasks Page'
    click_link '1 - Example Task 1'
    expect(page).to have_content 'Repeats every 5 days'
  end
  
  # should
  specify 'I can edit a task', :js => true do
    # Admin User
    user = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user.user_id)

    Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: user.user_id)

    user = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor = Vendor.create(user_id: user.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
    address = Address.create(vendor_id: vendor.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Tasks'
    click_link 'Example Task 1'
    click_link 'Edit'
    sleep(1)
    modal = find("#modalWindow")
    modal.fill_in 'Description', with: 'A great task'
    modal.click_button 'Update Task'
    sleep(1)
    click_link 'Example Task 1'
    expect(page).to have_content 'A great task'
    
  end

end