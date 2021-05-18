require 'rails_helper'

describe 'Admin vendor view' do

  specify 'I can navigate to the vendor accounts management page' do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Vendors'
    expect(page).to have_content 'Vendor Management'
  end

  specify 'I can view all the venders in the system' do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Vendors'
    expect(page).to have_content 'MM Quality'
    expect(page).to have_content 'Dairy prod'
  end

  specify 'I can view the details of a vendor' do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Vendors'
    expect(page).to have_content '1455'
  end

  specify 'I can search for a vendor', js: true do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Vendors'
    fill_in 'Vendor Company Name', with: 'MM'
    click_button 'Search'
    expect(page).to have_content 'MM Quality'
    expect(page).to have_no_content 'Dairy prod'
  end

  specify 'I can sort the list by Vendor Company Name' do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Vendors'
    find('#dropdownMenuLink').click
    click_link 'Vendor Company Name'
    expect(page).to have_text /Dairy prod[\s\S]+MM Quality/
  end

  specify 'I can sort the list by Vendor Company Number' do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Vendors'

    find('#dropdownMenuLink').click
    click_link 'Vendor Company Number'
    expect(page).to have_text /Dairy prod[\s\S]+MM Quality/
  end

  specify 'I can sort the list by Validated' do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Vendors'
    
    find('#dropdownMenuLink').click
    click_link 'Validated'
    expect(page).to have_text /MM Quality[\s\S]+Dairy prod/
  end

  def make_test_data
    # admin user
    user_admin = User.create(email: "domin@gmail.com", password: "password", user_name: "domin@gmail.com", is_admin: true)
    Admin.create(user_id: user_admin.user_id)

    # vendor user
    user_vendor1 = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor1 = Vendor.create(user_id: user_vendor1.user_id, company_name: "MM Quality", company_number: "1455", validated: false)
    address1 = Address.create(vendor_id: vendor1.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

    user_vendor2 = User.create(email: "dairy@gmail.com", password: "password", user_name: "dairy@gmail.com", is_admin: false)
    vendor2 = Vendor.create(user_id: user_vendor2.user_id, company_name: "Dairy prod", company_number: "121", validated: true)
    address2 = Address.create(vendor_id: vendor2.vendor_id, city_town: "Cambridge", country: "UK", house_name: "Store 51", postcode: "C1 4LS")
  end

end