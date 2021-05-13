require 'rails_helper'

describe 'Login' do

  specify 'I can login as an admin' do
    # Admin User
    user = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user.user_id)

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Admin Dashboard'
  end

  specify 'I can login as a vendor' do
    # Vendor User
    user = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor = Vendor.create(user_id: user.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
    address = Address.create(vendor_id: vendor.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

    visit '/users/sign_in'
    fill_in 'Email', with: 'mmq1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Vendor Home Page'
  end
end