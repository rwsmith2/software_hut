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
end