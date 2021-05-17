require 'rails_helper'

describe 'View account requests' do

  specify 'I can navigate to the request management page from homepage' do
    # Admin User
    user1 = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user1.user_id)

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Account Requests'
    expect(page).to have_content 'Request management'
  end

  specify 'I can see a list of account request' do
    # Admin User
    user1 = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user1.user_id)
    
    user2 = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor1 = Vendor.create(user_id: user2.user_id, company_name: "MM Quality", company_number: "1455", validated: false)
    address1 = Address.create(vendor_id: vendor1.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

    user3 = User.create(email: "dairy@gmail.com", password: "password", user_name: "dairy@gmail.com", is_admin: false)
    vendor2 = Vendor.create(user_id: user3.user_id, company_name: "Dairy prod", company_number: "121", validated: false)
    address2 = Address.create(vendor_id: vendor2.vendor_id, city_town: "Cambridge", country: "UK", house_name: "Store 51", postcode: "C! 4LS")
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Account Requests'
    expect(page).to have_content 'MM Quality'
    expect(page).to have_content 'Dairy prod'
  end

  specify 'I can view the details of a account request', :js => true do
    user1 = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user1.user_id)
    
    user2 = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor1 = Vendor.create(user_id: user2.user_id, company_name: "MM Quality", company_number: "1455", validated: false)
    address1 = Address.create(vendor_id: vendor1.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Account Requests'
    
    click_link 'MM Quality'
    expect(page).to have_content 'Sheffield'
  end

  specify 'I can accept an request', :js => true do
    user1 = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user1.user_id)

    user2 = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor1 = Vendor.create(user_id: user2.user_id, company_name: "MM Quality", company_number: "1455", validated: false)
    address1 = Address.create(vendor_id: vendor1.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")
    
    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Account Requests'
    click_link 'MM Quality'
    click_link 'Accept'

    new_vendor1 = Vendor.find(vendor1.id)
    expect(new_vendor1.validated).to be_truthy
    
  end

  specify 'I can reject an request', :js => true do
    user1 = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user1.user_id)

    user2 = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor1 = Vendor.create(user_id: user2.user_id, company_name: "MM Quality", company_number: "1455", validated: false)
    address1 = Address.create(vendor_id: vendor1.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Account Requests'
    click_link 'MM Quality'
    click_link 'Reject'

    new_vendor1 = Vendor.where(vendor_id: vendor1.id)
    expect(new_vendor1.count).to eq(0)
  end

end