require 'rails_helper'

describe 'User password change' do

  specify 'I can navigate to the change password page' do
    # Admin User
    user = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true)
    Admin.create(user_id: user.user_id)

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Change password'
    expect(page).to have_content 'New password'

  end

  specify 'I can change my passsword' do
    # Admin User
    user = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true)
    Admin.create(user_id: user.user_id)

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Change password'
    fill_in 'New password', with: 'newpassword'
    fill_in 'Repeat password', with: 'newpassword'
    click_button 'Update'
    expect(page).to have_content 'Password updated, please logout'
  end

end