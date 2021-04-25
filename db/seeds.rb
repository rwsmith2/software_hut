
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Admin User
user = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
Admin.create(user_id: user.user_id)

# Vendor User
user = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
vendor = Vendor.create(user_id: user.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
address = Address.create(vendor_id: vendor.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

user = User.create(email: "dairy@gmail.com", password: "password", user_name: "dairy@gmail.com", is_admin: false)
vendor = Vendor.create(user_id: user.user_id, company_name: "Dairy prod", company_number: "121", validated: true)
address = Address.create(vendor_id: vendor.vendor_id, city_town: "Cambridge", country: "UK", house_name: "Store 51", postcode: "C! 4LS")

user = User.create(email: "water@gmail.com", password: "password", user_name: "water@gmail.com", is_admin: false)
vendor = Vendor.create(user_id: user.user_id, company_name: "Water distr", company_number: "003", validated: true)
address = Address.create(vendor_id: vendor.vendor_id, city_town: "Sheffield", country: "UK", house_name: "Quality water 14", postcode: "S10 5LL")

user = User.create(email: "vendorTest4@gmail.com", password: "password", user_name: "vendorTest2@gmail.com", is_admin: false)
vendor = Vendor.create(user_id: user.user_id, company_name: "Test Company 4", company_number: "004", validated: true)
address = Address.create(vendor_id: vendor.vendor_id, city_town: "Test City 4", country: "Test Country/Region 2", house_name: "Test Address 2", postcode: "Test Postcode 2")

user = User.create(email: "vendorTest5@gmail.com", password: "password", user_name: "vendorTest2@gmail.com", is_admin: false)
vendor = Vendor.create(user_id: user.user_id, company_name: "Test Company 5", company_number: "005", validated: true)
address = Address.create(vendor_id: vendor.vendor_id, city_town: "Test City 5", country: "Test Country/Region 5", house_name: "Test Address 2", postcode: "Test Postcode 2")


# Tasks 
Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: "2")
Task.create(task_title: "Example Task 2", task_description: "B nice Task", estimation: "1", user_id: "2")
Task.create(task_title: "Upload vendor certificate", task_description: "Upload your new vendor certificate", estimation: "1", user_id: "2")
Task.create(task_title: "Quotation", task_description: "Request new quotation", estimation: "1", user_id: "2")
Task.create(task_title: "Triage", task_description: "Do triage assessment", estimation: "40", user_id: "2")
# Given task + assign tasks

GivenTask.create(set_date: "2021-04-25", due_date: "2021-05-01",priority: "2",repeatable: "7", task_id: "5")
GivenTask.create(set_date: "2021-04-20", due_date: "2021-05-20",priority: "1", repeatable: "5", task_id: "2")
GivenTask.create(set_date: "2021-04-17", due_date: "2021-05-05",priority: "3", repeatable: "12", task_id: "3")
GivenTask.create(set_date: "2021-04-17", due_date: "2021-05-05",priority: "3", repeatable: "12", task_id: "4")

# Assign tasks
Assignment.create(vendor_id: "1", given_task_id: "1")
Assignment.create(vendor_id: "2", given_task_id: "1")
Assignment.create(complete: "true",vendor_id: "2", given_task_id: "2")
Assignment.create(vendor_id: "2", given_task_id: "4")
Assignment.create(complete: "true",vendor_id: "2", given_task_id: "3")

# Assessment
Assessment.create(assessment_title: "Triage questions")
Assessment.create(assessment_title: "First assessment for new vendors")
Assessment.create(assessment_title: "Second assessment for new vendors")
Assessment.create(assessment_title: "Third assessment for new vendors")
Assessment.create(assessment_title: "For water supplier")

# Assessment linker
AssessmentLinker.create(task_id: "5", assessment_id: "1")
AssessmentLinker.create(task_id: "4", assessment_id: "2")
AssessmentLinker.create(task_id: "3", assessment_id: "3")
AssessmentLinker.create(task_id: "2", assessment_id: "4")
AssessmentLinker.create(task_id: "1", assessment_id: "5")

# Assessment questions
Question.create(question_text: "Are you eligible of ..?", assessment_id: "1")
Question.create(question_text: "Could you do ..?", assessment_id: "1")
Question.create(question_text: "What do you think of ..?", assessment_id: "1")
Question.create(question_text: "How will you ..?", assessment_id: "1")
Question.create(question_text: "Will you do ..?", assessment_id: "1")
Question.create(question_text: "What do you think ..?", assessment_id: "1")
Question.create(question_text: "When was  ..?", assessment_id: "1")
Question.create(question_text: "How often do..?", assessment_id: "1")
Question.create(question_text: "How many ..?", assessment_id: "1")
Question.create(question_text: "Where was ..?", assessment_id: "1")
Question.create(question_text: "When was  ..?", assessment_id: "1")
Question.create(question_text: "What do you think ..?", assessment_id: "1")
Question.create(question_text: "Are you eligible of ..?", assessment_id: "1")
Question.create(question_text: "Could you do ..?", assessment_id: "1")
Question.create(question_text: "What do you think of ..?", assessment_id: "1")
Question.create(question_text: "How will you ..?", assessment_id: "1")
Question.create(question_text: "Will you do ..?", assessment_id: "1")
Question.create(question_text: "What do you think ..?", assessment_id: "1")
Question.create(question_text: "When was  ..?", assessment_id: "1")
Question.create(question_text: "How often do..?", assessment_id: "1")
Question.create(question_text: "How many ..?", assessment_id: "1")
Question.create(question_text: "Where was ..?", assessment_id: "1")
Question.create(question_text: "When was  ..?", assessment_id: "1")
Question.create(question_text: "What do you think ..?", assessment_id: "1")

# Answers
Answer.create(answer_text: "Yes", question_id: "1")
Answer.create(answer_text: "No", question_id: "1")
Answer.create(answer_text: "Yes", question_id: "2")
Answer.create(answer_text: "No", question_id: "2")
Answer.create(answer_text: "In future", question_id: "2")
Answer.create(answer_text: "Good", question_id: "3")
Answer.create(answer_text: "Neutral", question_id: "3")
Answer.create(answer_text: "Not good", question_id: "3")
Answer.create(answer_text: "By doing ...", question_id: "4")
Answer.create(answer_text: "By not doing ..", question_id: "4")
Answer.create(answer_text: "By implementing ...", question_id: "4")
Answer.create(answer_text: "Yes", question_id: "5")
Answer.create(answer_text: "No", question_id: "5")
Answer.create(answer_text: "Good", question_id: "6")
Answer.create(answer_text: "Neutral", question_id: "6")
Answer.create(answer_text: "Not good", question_id: "6")
Answer.create(answer_text: "< 1 year", question_id: "7")
Answer.create(answer_text: "Between 1 to 2 years", question_id: "7")
Answer.create(answer_text: "> 2 years", question_id: "7")
Answer.create(answer_text: "Always", question_id: "8")
Answer.create(answer_text: "Sometimes", question_id: "8")
Answer.create(answer_text: "Often", question_id: "8")
Answer.create(answer_text: "Never", question_id: "8")
Answer.create(answer_text: "1-2 ... ", question_id: "9")
Answer.create(answer_text: "More than 2 .... ", question_id: "9")
Answer.create(answer_text: "5 and more ....", question_id: "9")
Answer.create(answer_text: "Another region", question_id: "10")
Answer.create(answer_text: "Same region ", question_id: "10")
Answer.create(answer_text: "Different city", question_id: "10")
Answer.create(answer_text: "< 1 year", question_id: "11")
Answer.create(answer_text: "Between 1 to 2 years", question_id: "11")
Answer.create(answer_text: "> 2 years", question_id: "11")
Answer.create(answer_text: "Good", question_id: "12")
Answer.create(answer_text: "Neutral", question_id: "12")
Answer.create(answer_text: "Not good", question_id: "12")


Answer.create(answer_text: "Yes", question_id: "13")
Answer.create(answer_text: "No", question_id: "13")
Answer.create(answer_text: "Yes", question_id: "14")
Answer.create(answer_text: "No", question_id: "14")
Answer.create(answer_text: "In future", question_id: "14")
Answer.create(answer_text: "Good", question_id: "15")
Answer.create(answer_text: "Neutral", question_id: "15")
Answer.create(answer_text: "Not good", question_id: "15")
Answer.create(answer_text: "By doing ...", question_id: "16")
Answer.create(answer_text: "By not doing ..", question_id: "16")
Answer.create(answer_text: "By implementing ...", question_id: "16")
Answer.create(answer_text: "Yes", question_id: "17")
Answer.create(answer_text: "No", question_id: "17")
Answer.create(answer_text: "Good", question_id: "18")
Answer.create(answer_text: "Neutral", question_id: "18")
Answer.create(answer_text: "Not good", question_id: "18")
Answer.create(answer_text: "< 1 year", question_id: "19")
Answer.create(answer_text: "Between 1 to 2 years", question_id: "19")
Answer.create(answer_text: "> 2 years", question_id: "19")
Answer.create(answer_text: "Always", question_id: "20")
Answer.create(answer_text: "Sometimes", question_id: "20")
Answer.create(answer_text: "Often", question_id: "20")
Answer.create(answer_text: "Never", question_id: "20")
Answer.create(answer_text: "1-2 ... ", question_id: "21")
Answer.create(answer_text: "More than 2 .... ", question_id: "21")
Answer.create(answer_text: "5 and more ....", question_id: "21")
Answer.create(answer_text: "Another region", question_id: "22")
Answer.create(answer_text: "Same region ", question_id: "22")
Answer.create(answer_text: "Different city", question_id: "22")
Answer.create(answer_text: "< 1 year", question_id: "23")
Answer.create(answer_text: "Between 1 to 2 years", question_id: "23")
Answer.create(answer_text: "> 2 years", question_id: "23")
Answer.create(answer_text: "Good", question_id: "24")
Answer.create(answer_text: "Neutral", question_id: "24")
Answer.create(answer_text: "Not good", question_id: "24")


#Assignment.create(complete: false,vendor_id: "1",given_task_id: "1")