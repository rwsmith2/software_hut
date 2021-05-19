require 'rails_helper'

describe 'Vendor account request' do

  specify 'I can navigate to the request form from login page' do
    visit '/users/sign_in'
    click_link 'Request an account'
    expect(page).to have_content 'Request for a new account'
  end

  specify 'I can fill in and submit an account request' do
    visit '/users/sign_in'
    click_link 'Request an account'
    fill_in 'Email', with: 'request@gmail.com'
    fill_in 'Company name', with: 'companyA'
    fill_in 'Address', with: '1st Street'
    fill_in 'City/Town', with: 'London'
    fill_in 'Postcode ', with: 'S1'
    fill_in 'Country/Region', with: 'UK'
    click_button 'Request'
    expect(page).to have_content 'Success'
  end

  specify 'I can get warning if the email is not avaliable' do
    user = User.create(email: "test@gmail.com",password: "password" ,user_name: "test@gmail.com", is_admin: true) #user_id = 2

    visit '/users/sign_in'
    click_link 'Request an account'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Company name', with: 'companyA'
    fill_in 'Address', with: '1st Street'
    fill_in 'City/Town', with: 'London'
    fill_in 'Postcode ', with: 'S1'
    fill_in 'Country/Region', with: 'UK'
    click_button 'Request'
    expect(page).to have_content 'Email has already been taken'
  end

  specify 'I can get warning if Company name is empty' do
    visit '/users/sign_in'
    click_link 'Request an account'
    fill_in 'Email', with: 'request@gmail.com'
    fill_in 'Address', with: '1st Street'
    fill_in 'City/Town', with: 'London'
    fill_in 'Postcode ', with: 'S1'
    fill_in 'Country/Region', with: 'UK'
    click_button 'Request'
    expect(page).to have_content 'can\'t be blank'
  end

  specify 'I can get warning if the address is empty' do
    visit '/users/sign_in'
    click_link 'Request an account'
    fill_in 'Email', with: 'request@gmail.com'
    fill_in 'Company name', with: 'companyA'
    fill_in 'City/Town', with: 'London'
    fill_in 'Postcode ', with: 'S1'
    fill_in 'Country/Region', with: 'UK'
    click_button 'Request'
    expect(page).to have_content 'can\'t be blank'
  end
end