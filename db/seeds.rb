# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Admin User
user = User.create(email: "adminTest1@gmail.com",password: "password" ,user_name: "adminTest1@gmail.com", is_admin: true) #user_id = 2
Admin.create(user_id: user.user_id)

# Vendor User
user = User.create(email: "vendorTest1@gmail.com", password: "password", user_name: "vendorTest1@gmail.com", is_admin: false)
vendor = Vendor.create(user_id: user.user_id, company_name: "Test Company 1", company_number: "001", validated: true)
address = Address.create(vendor_id: vendor.vendor_id, city_town: "Test City 1", country: "Test Country/Region 1", house_name: "Test Address 1", postcode: "Test Postcode 1")

user = User.create(email: "vendorTest2@gmail.com", password: "password", user_name: "vendorTest2@gmail.com", is_admin: false)
vendor = Vendor.create(user_id: user.user_id, company_name: "Test Company 2", company_number: "002", validated: true)
address = Address.create(vendor_id: vendor.vendor_id, city_town: "Test City 2", country: "Test Country/Region 2", house_name: "Test Address 2", postcode: "Test Postcode 2")

# #Tasks 
Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: "2")
Task.create(task_title: "Axample Task 2", task_description: "B nice Task", estimation: "1", user_id: "2")

GivenTask.create(set_date: "2021-01-15", due_date: "2021-02-01",priority: "2",repeatable: "7", task_id: "1")
GivenTask.create(set_date: "2021-01-20", due_date: "2021-02-20",priority: "1", repeatable: "5", task_id: "2")
GivenTask.create(set_date: "2021-01-17", due_date: "2021-02-05",priority: "3", repeatable: "12", task_id: "3")

#Assignment.create(complete: false,vendor_id: "1",given_task_id: "1")