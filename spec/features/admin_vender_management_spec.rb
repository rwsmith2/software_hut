require 'rails_helper'

describe 'Admin vendor management' do

  specify 'I can delete a vendor account from the system, TODO: fix double confirm popups', :js => true do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Vendors'
    click_link 'Edit/View'
    accept_alert do
      click_link 'Destroy'
    end
    expect(page).to have_no_content '1455'
  end

  specify 'I can add a vendor account from the system', :js => true do
    make_test_data

    visit '/users/sign_in'
    fill_in 'Email', with: 'domin@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Vendors'
    click_link 'Create vendor'
    fill_in 'Email', with: 'addvendor@gmail.com'
    fill_in 'Company name', with: 'a new company'
    fill_in 'Address', with: '1 street'
    fill_in 'City/Town', with: 'Sheffield'
    fill_in 'Postcode', with: 'S1'
    fill_in 'Country/Region', with: 'UK'

    modal = find('#modalWindow')
    modal.click_button 'Create Vendor'

    # expect(page).to have_no_content '1455'
  end

  def make_test_data
    # admin user
    user_admin = User.create(email: "domin@gmail.com", password: "password", user_name: "domin@gmail.com", is_admin: true)
    Admin.create(user_id: user_admin.user_id)

    # vendor user
    user_vendor1 = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
    vendor1 = Vendor.create(user_id: user_vendor1.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
    address1 = Address.create(vendor_id: vendor1.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

    user_vendor2 = User.create(email: "dairy@gmail.com", password: "password", user_name: "dairy@gmail.com", is_admin: false)
    vendor2 = Vendor.create(user_id: user_vendor2.user_id, company_name: "Dairy prod", company_number: "121", validated: true)
    address2 = Address.create(vendor_id: vendor2.vendor_id, city_town: "Cambridge", country: "UK", house_name: "Store 51", postcode: "C1 4LS")
  end

end