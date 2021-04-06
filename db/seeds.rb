# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Admin User
User.create(email: "adminTest1@gmail.com",password: "password" ,user_name: "admin1", is_admin: true) #user_id = 2
User.create(email: "vendorTest1@gmail.com",password: "password" ,user_name: "vendor1", is_admin: false) #user_id = 2
# Admin.create(user_id: "2")

# #Vendor User
# User.create(email: "vendorTest1@gmail.com",password: "password" ,user_name: "vendor1", is_admin: false) #user_id = 3
# Vendor.create(user_id: "3",company_name: "company1", company_number: "012345", validated: true)

# User.create(email: "vendorTest2@gmail.com",password: "password" ,user_name: "vendor2", is_admin: false) #user_id =4
# Vendor.create(user_id: "4",company_name: "company2", company_number: "666333", validated: true)


# #Tasks 
# Task.create(task_title: "Example Task 1", task_description: "A nice Task", upload_type: "1", estimation: "1", admin_id: "2")