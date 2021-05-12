
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Admin User
user1 = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
Admin.create(user_id: user1.user_id)

# Vendor User
user2 = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)
vendor1 = Vendor.create(user_id: user2.user_id, company_name: "MM Quality", company_number: "1455", validated: true)
address1 = Address.create(vendor_id: vendor1.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

user3 = User.create(email: "dairy@gmail.com", password: "password", user_name: "dairy@gmail.com", is_admin: false)
vendor2 = Vendor.create(user_id: user3.user_id, company_name: "Dairy prod", company_number: "121", validated: true)
address2 = Address.create(vendor_id: vendor2.vendor_id, city_town: "Cambridge", country: "UK", house_name: "Store 51", postcode: "C! 4LS")

user4 = User.create(email: "water@gmail.com", password: "password", user_name: "water@gmail.com", is_admin: false)
vendor3 = Vendor.create(user_id: user4.user_id, company_name: "Water distr", company_number: "003", validated: true)
address3 = Address.create(vendor_id: vendor3.vendor_id, city_town: "Sheffield", country: "UK", house_name: "Quality water 14", postcode: "S10 5LL")

user5 = User.create(email: "vendorTest4@gmail.com", password: "password", user_name: "vendorTest2@gmail.com", is_admin: false)
vendor4 = Vendor.create(user_id: user5.user_id, company_name: "Test Company 4", company_number: "004", validated: true)
address4 = Address.create(vendor_id: vendor4.vendor_id, city_town: "Test City 4", country: "Test Country/Region 2", house_name: "Test Address 2", postcode: "Test Postcode 2")

user6 = User.create(email: "vendorTest5@gmail.com", password: "password", user_name: "vendorTest2@gmail.com", is_admin: false)
vendor5 = Vendor.create(user_id: user6.user_id, company_name: "Test Company 5", company_number: "005", validated: true)
address5 = Address.create(vendor_id: vendor5.vendor_id, city_town: "Test City 5", country: "Test Country/Region 5", house_name: "Test Address 2", postcode: "Test Postcode 2")


# Tasks 
task1 = Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: user2.user_id)
task2 = Task.create(task_title: "Example Task 2", task_description: "B nice Task", estimation: "1", user_id: user2.user_id)
task3 = Task.create(task_title: "Upload vendor certificate", task_description: "Upload your new vendor certificate", estimation: "1", user_id: user2.user_id)
task4 = Task.create(task_title: "Quotation", task_description: "Request new quotation", estimation: "1", user_id: user2.user_id)
task5 = Task.create(task_title: "Triage", task_description: "Do triage assessment", estimation: "40", user_id: user2.user_id)
# Given task + assign tasks

given_task1 = GivenTask.create(set_date: "2021-04-25", due_date: "2021-05-01",priority: "2",repeatable: "7", task_id: task5.task_id)
given_task2 = GivenTask.create(set_date: "2021-04-20", due_date: "2021-05-20",priority: "1", repeatable: "5", task_id: task2.task_id)
given_task3 = GivenTask.create(set_date: "2021-04-17", due_date: "2021-05-05",priority: "3", repeatable: "12", task_id: task3.task_id)
given_task4 = GivenTask.create(set_date: "2021-04-17", due_date: "2021-05-05",priority: "3", repeatable: "12", task_id: task4.task_id)

# Assign tasks
assignment1 = Assignment.create(vendor_id: vendor1.vendor_id, given_task_id: given_task1.given_task_id)
assignment2 = Assignment.create(vendor_id: vendor2.vendor_id, given_task_id: given_task1.given_task_id)
assignment3 = Assignment.create(complete: "true",vendor_id: vendor2.vendor_id, given_task_id: given_task2.given_task_id)
assignment4 = Assignment.create(vendor_id: vendor2.vendor_id, given_task_id: given_task4.given_task_id)
assignment5 = Assignment.create(complete: "true",vendor_id: vendor2.vendor_id, given_task_id: given_task3.given_task_id)

# Assessment
assessment1 = Assessment.create(assessment_title: "Triage questions")
assessment2 = Assessment.create(assessment_title: "First assessment for new vendors")
assessment3 = Assessment.create(assessment_title: "Second assessment for new vendors")
assessment4 = Assessment.create(assessment_title: "Third assessment for new vendors")
assessment5 = Assessment.create(assessment_title: "For water supplier")

# Assessment linker
assessment_linker1 = AssessmentLinker.create(task_id: task5.task_id, assessment_id: assessment1.assessment_id)
assessment_linker2 = AssessmentLinker.create(task_id: task4.task_id, assessment_id: assessment2.assessment_id)
assessment_linker3 = AssessmentLinker.create(task_id: task3.task_id, assessment_id: assessment3.assessment_id)
assessment_linker4 = AssessmentLinker.create(task_id: task2.task_id, assessment_id: assessment4.assessment_id)
assessment_linker5 = AssessmentLinker.create(task_id: task1.task_id, assessment_id: assessment5.assessment_id)

# Assessment questions
question1 = Question.create(question_text: "Are you eligible of ..?", assessment_id: assessment1.assessment_id)
question2 = Question.create(question_text: "Could you do ..?", assessment_id: assessment1.assessment_id)
question3 = Question.create(question_text: "What do you think of ..?", assessment_id: assessment1.assessment_id)
question4 = Question.create(question_text: "How will you ..?", assessment_id: assessment1.assessment_id)
question5 = Question.create(question_text: "Will you do ..?", assessment_id: assessment1.assessment_id)
question6 = Question.create(question_text: "What do you think ..?", assessment_id: assessment1.assessment_id)
question7 = Question.create(question_text: "When was  ..?", assessment_id: assessment1.assessment_id)
question8 = Question.create(question_text: "How often do..?", assessment_id: assessment1.assessment_id)
question9 = Question.create(question_text: "How many ..?", assessment_id: assessment1.assessment_id)
question10 = Question.create(question_text: "Where was ..?", assessment_id: assessment1.assessment_id)
question11 = Question.create(question_text: "When was  ..?", assessment_id: assessment1.assessment_id)
question12 = Question.create(question_text: "What do you think ..?", assessment_id: assessment1.assessment_id)
question13 = Question.create(question_text: "Are you eligible of ..?", assessment_id: assessment1.assessment_id)
question14 = Question.create(question_text: "Could you do ..?", assessment_id: assessment1.assessment_id)
question15 = Question.create(question_text: "What do you think of ..?", assessment_id: assessment1.assessment_id)
question16 = Question.create(question_text: "How will you ..?", assessment_id: assessment1.assessment_id)
question17 = Question.create(question_text: "Will you do ..?", assessment_id: assessment1.assessment_id)
question18 = Question.create(question_text: "What do you think ..?", assessment_id: assessment1.assessment_id)
question19 = Question.create(question_text: "When was  ..?", assessment_id: assessment1.assessment_id)
question20 = Question.create(question_text: "How often do..?", assessment_id: assessment1.assessment_id)
question21 = Question.create(question_text: "How many ..?", assessment_id: assessment1.assessment_id)
question22 = Question.create(question_text: "Where was ..?", assessment_id: assessment1.assessment_id)
question23 = Question.create(question_text: "When was  ..?", assessment_id: assessment1.assessment_id)
question24 = Question.create(question_text: "What do you think ..?", assessment_id: assessment1.assessment_id)

# Answers
answer1 = Answer.create(answer_text: "Yes", question_id: question1.question_id)
answer2 = Answer.create(answer_text: "No", question_id: question1.question_id)
answer3 = Answer.create(answer_text: "Yes", question_id: question2.question_id)
answer4 = Answer.create(answer_text: "No", question_id: question2.question_id)
answer5 = Answer.create(answer_text: "In future", question_id: question3.question_id)
answer6 = Answer.create(answer_text: "Good", question_id: question3.question_id)
answer7 = Answer.create(answer_text: "Neutral", question_id: question3.question_id)
answer8 = Answer.create(answer_text: "Not good", question_id: question3.question_id)
answer9 = Answer.create(answer_text: "By doing ...", question_id: question4.question_id)
answer10 = Answer.create(answer_text: "By not doing ..", question_id: question4.question_id)
answer11 = Answer.create(answer_text: "By implementing ...", question_id: question4.question_id)
answer12 = Answer.create(answer_text: "Yes", question_id: question5.question_id)
answer13 = Answer.create(answer_text: "No", question_id: question5.question_id)
answer14 = Answer.create(answer_text: "Good", question_id: question6.question_id)
answer15 = Answer.create(answer_text: "Neutral", question_id: question6.question_id)
answer16 = Answer.create(answer_text: "Not good", question_id: question6.question_id)
answer17 = Answer.create(answer_text: "< 1 year", question_id: question7.question_id)
answer18 = Answer.create(answer_text: "Between 1 to 2 years", question_id: question7.question_id)
answer19 = Answer.create(answer_text: "> 2 years", question_id: question7.question_id)
answer20 = Answer.create(answer_text: "Always", question_id: question8.question_id)
answer21 = Answer.create(answer_text: "Sometimes", question_id: question8.question_id)
answer22 = Answer.create(answer_text: "Often", question_id: question8.question_id)
answer23 = Answer.create(answer_text: "Never", question_id: question8.question_id)
answer24 = Answer.create(answer_text: "1-2 ... ", question_id: question9.question_id)
answer25 = Answer.create(answer_text: "More than 2 .... ", question_id: question9.question_id)
answer26 = Answer.create(answer_text: "5 and more ....", question_id: question9.question_id)
answer27 = Answer.create(answer_text: "Another region", question_id: question10.question_id)
answer28 = Answer.create(answer_text: "Same region ", question_id: question10.question_id)
answer29 = Answer.create(answer_text: "Different city", question_id: question10.question_id)
answer30 = Answer.create(answer_text: "< 1 year", question_id: question11.question_id)
answer31 = Answer.create(answer_text: "Between 1 to 2 years", question_id: question11.question_id)
answer32 = Answer.create(answer_text: "> 2 years", question_id: question11.question_id)
answer33 = Answer.create(answer_text: "Good", question_id: question12.question_id)
answer34 = Answer.create(answer_text: "Neutral", question_id: question12.question_id)
answer35 = Answer.create(answer_text: "Not good", question_id: question12.question_id)


answer36 = Answer.create(answer_text: "Yes", question_id: question13.question_id)
answer37 = Answer.create(answer_text: "No", question_id: question13.question_id)
answer38 = Answer.create(answer_text: "Yes", question_id: question14.question_id)
answer39 = Answer.create(answer_text: "No", question_id: question14.question_id)
answer40 = Answer.create(answer_text: "In future", question_id: question14.question_id)
answer41 = Answer.create(answer_text: "Good", question_id: question15.question_id)
answer42 = Answer.create(answer_text: "Neutral", question_id: question15.question_id)
answer43 = Answer.create(answer_text: "Not good", question_id: question15.question_id)
answer44 = Answer.create(answer_text: "By doing ...", question_id: question16.question_id)
answer45 = Answer.create(answer_text: "By not doing ..", question_id: question16.question_id)
answer46 = Answer.create(answer_text: "By implementing ...", question_id: question16.question_id)
answer47 = Answer.create(answer_text: "Yes", question_id: question17.question_id)
answer48 = Answer.create(answer_text: "No", question_id: question17.question_id)
answer49 = Answer.create(answer_text: "Good", question_id: question18.question_id)
answer50 = Answer.create(answer_text: "Neutral", question_id: question18.question_id)
answer51 = Answer.create(answer_text: "Not good", question_id: question18.question_id)
answer52 = Answer.create(answer_text: "< 1 year", question_id: question19.question_id)
answer53 = Answer.create(answer_text: "Between 1 to 2 years", question_id: question19.question_id)
answer54 = Answer.create(answer_text: "> 2 years", question_id: question19.question_id)
answer55 = Answer.create(answer_text: "Always", question_id: question20.question_id)
answer56 = Answer.create(answer_text: "Sometimes", question_id: question20.question_id)
answer57 = Answer.create(answer_text: "Often", question_id: question20.question_id)
answer58 = Answer.create(answer_text: "Never", question_id: question20.question_id)
answer59 = Answer.create(answer_text: "1-2 ... ", question_id: question21.question_id)
answer60 = Answer.create(answer_text: "More than 2 .... ", question_id: question21.question_id)
answer61 = Answer.create(answer_text: "5 and more ....", question_id: question21.question_id)
answer62 = Answer.create(answer_text: "Another region", question_id: question22.question_id)
answer63 = Answer.create(answer_text: "Same region ", question_id: question22.question_id)
answer64 = Answer.create(answer_text: "Different city", question_id: question22.question_id)
answer65 = Answer.create(answer_text: "< 1 year", question_id: question23.question_id)
answer66 = Answer.create(answer_text: "Between 1 to 2 years", question_id: question23.question_id)
answer67 = Answer.create(answer_text: "> 2 years", question_id: question23.question_id)
answer68 = Answer.create(answer_text: "Good", question_id: question24.question_id)
answer69 = Answer.create(answer_text: "Neutral", question_id: question24.question_id)
answer70 = Answer.create(answer_text: "Not good", question_id: question24.question_id)


#Assignment.create(complete: false,vendor_id: "1",given_task_id: "1")