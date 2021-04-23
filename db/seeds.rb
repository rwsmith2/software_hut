# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# #Admin User
User.create(email: "adminTest1@gmail.com",password: "password" ,user_name: "admin1", is_admin: true) #user_id = 2
User.create(email: "vendorTest1@gmail.com",password: "password" ,user_name: "vendor1", is_admin: false) #user_id = 2
Admin.create(user_id: "2")

# #Vendor User
# User.create(email: "vendorTest1@gmail.com",password: "password" ,user_name: "vendor1", is_admin: false) #user_id = 3

Vendor.create(user_id: 1, company_name: "vendor1", company_number: 012345, validated: true)
Vendor.create(user_id: 2, company_name: "vendor2", company_number: 0123, validated: true)

# User.create(email: "vendorTest2@gmail.com",password: "password" ,user_name: "vendor2", is_admin: false) #user_id =4
# Vendor.create(user_id: "4",company_name: "company2", company_number: "666333", validated: true)


# #Tasks 
Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: "2")
Task.create(task_title: "Axample Task 2", task_description: "B nice Task", estimation: "1", user_id: "2")

GivenTask.create(set_date: "2021-01-15", due_date: "2021-02-01",priority: "2",repeatable: "7", task_id: "1")
GivenTask.create(set_date: "2021-01-20", due_date: "2021-02-20",priority: "1", repeatable: "5", task_id: "2")
GivenTask.create(set_date: "2021-01-17", due_date: "2021-02-05",priority: "3", repeatable: "12", task_id: "3")

#Assignment.create(complete: false,vendor_id: "1",given_task_id: "1")