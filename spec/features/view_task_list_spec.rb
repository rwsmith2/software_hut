require 'rails_helper'

describe 'View task list' do

  specify 'I can navigate to the task list page from homepage as an admin' do
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

  specify 'I can see a list of assigned tasks' do
    # Admin User
    user1 = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user1.user_id)

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Given Tasks Page'


  end

  # should
  specify 'I can search for specific vendors', :js => true do

  end

end