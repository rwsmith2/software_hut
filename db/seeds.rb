
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
#address1 = Address.create(vendor_id: vendor1.vendor_id, city_town: "Sheffield", country: "Sheffield", house_name: "67", postcode: "S1 CBQ")

user3 = User.create(email: "dairy@gmail.com", password: "password", user_name: "dairy@gmail.com", is_admin: false)
vendor2 = Vendor.create(user_id: user3.user_id, company_name: "Dairy prod", company_number: "121", validated: true)
#address2 = Address.create(vendor_id: vendor2.vendor_id, city_town: "Cambridge", country: "UK", house_name: "Store 51", postcode: "C! 4LS")

user4 = User.create(email: "water@gmail.com", password: "password", user_name: "water@gmail.com", is_admin: false)
vendor3 = Vendor.create(user_id: user4.user_id, company_name: "Water distr", company_number: "003", validated: true)
#address3 = Address.create(vendor_id: vendor3.vendor_id, city_town: "Sheffield", country: "UK", house_name: "Quality water 14", postcode: "S10 5LL")

user5 = User.create(email: "vendorTest4@gmail.com", password: "password", user_name: "vendorTest2@gmail.com", is_admin: false)
vendor4 = Vendor.create(user_id: user5.user_id, company_name: "Test Company 4", company_number: "004", validated: true)
##address4 = Address.create(vendor_id: vendor4.vendor_id, city_town: "Test City 4", country: "Test Country/Region 2", house_name: "Test Address 2", postcode: "Test Postcode 2")

user6 = User.create(email: "vendorTest5@gmail.com", password: "password", user_name: "vendorTest2@gmail.com", is_admin: false)
vendor5 = Vendor.create(user_id: user6.user_id, company_name: "Test Company 5", company_number: "005", validated: true)
#address5 = Address.create(vendor_id: vendor5.vendor_id, city_town: "Test City 5", country: "Test Country/Region 5", house_name: "Test Address 2", postcode: "Test Postcode 2")


# Tasks 
task1 = Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1")
task2 = Task.create(task_title: "Example Task 2", task_description: "B nice Task", estimation: "1")
task3 = Task.create(task_title: "Upload vendor certificate", task_description: "Upload your new vendor certificate", estimation: "1")
task4 = Task.create(task_title: "Quotation", task_description: "Request new quotation", estimation: "1")
task5 = Task.create(task_title: "Triage", task_description: "Do triage assessment", estimation: "40")


puts task5.inspect

# Given task + assign tasks
given_task1 = GivenTask.create(set_date: "2021-04-25", due_date: "2021-05-01",priority: "2",repeatable: "0", task_id: task5.task_id)
given_task2 = GivenTask.create(set_date: "2021-04-20", due_date: "2021-05-20",priority: "1", repeatable: "0", task_id: task2.task_id)
given_task3 = GivenTask.create(set_date: "2021-04-17", due_date: "2021-05-05",priority: "3", repeatable: "0", task_id: task3.task_id)
given_task4 = GivenTask.create(set_date: "2021-04-17", due_date: "2021-05-05",priority: "3", repeatable: "0", task_id: task4.task_id)


puts given_task4.inspect

# Assign tasks
assignment1 = Assignment.create(vendor_id: vendor1.vendor_id, given_task_id: given_task1.given_task_id, complete_by: "2021-05-13")
assignment2 = Assignment.create(vendor_id: vendor2.vendor_id, given_task_id: given_task1.given_task_id, complete_by: "2021-06-02")
assignment3 = Assignment.create(complete: "true",vendor_id: vendor2.vendor_id, given_task_id: given_task2.given_task_id)
assignment4 = Assignment.create(vendor_id: vendor2.vendor_id, given_task_id: given_task4.given_task_id, complete_by: "2021-06-01")
assignment5 = Assignment.create(complete: "true",vendor_id: vendor2.vendor_id, given_task_id: given_task3.given_task_id)


puts assignment5.inspect

# Assessment
assessment1 = Assessment.new(assessment_title: "Triage questions")
assessment2 = Assessment.new(assessment_title: "First assessment for new vendors")
assessment3 = Assessment.new(assessment_title: "Second assessment for new vendors")
assessment4 = Assessment.new(assessment_title: "Third assessment for new vendors")
assessment5 = Assessment.new(assessment_title: "For water supplier")


assessment2.save(:validate => false)
assessment3.save(:validate => false)
assessment4.save(:validate => false)
assessment1.save(:validate => false)
assessment5.save(:validate => false)


puts assessment5.inspect

# Assessment linker
assessment_linker1 = AssessmentLinker.create(task_id: task5.task_id, assessment_id: assessment1.assessment_id)
assessment_linker2 = AssessmentLinker.create(task_id: task4.task_id, assessment_id: assessment2.assessment_id)
assessment_linker3 = AssessmentLinker.create(task_id: task3.task_id, assessment_id: assessment3.assessment_id)
assessment_linker4 = AssessmentLinker.create(task_id: task2.task_id, assessment_id: assessment4.assessment_id)
assessment_linker5 = AssessmentLinker.create(task_id: task1.task_id, assessment_id: assessment5.assessment_id)


puts assessment_linker5.inspect

# Assessment questions
question1 = Question.new(question_text: "Are you eligible of ..?", assessment_id: assessment1.assessment_id)
question2 = Question.new(question_text: "Could you do ..?", assessment_id: assessment1.assessment_id)
question3 = Question.new(question_text: "What do you think of ..?", assessment_id: assessment1.assessment_id)
question4 = Question.new(question_text: "How will you ..?", assessment_id: assessment1.assessment_id)
question5 = Question.new(question_text: "Will you do ..?", assessment_id: assessment1.assessment_id)
question6 = Question.new(question_text: "What do you think ..?", assessment_id: assessment1.assessment_id)
question7 = Question.new(question_text: "When was  ..?", assessment_id: assessment1.assessment_id)
question8 = Question.new(question_text: "How often do..?", assessment_id: assessment1.assessment_id)
question9 = Question.new(question_text: "How many ..?", assessment_id: assessment1.assessment_id)
question10 = Question.new(question_text: "Where was ..?", assessment_id: assessment1.assessment_id)
question11 = Question.new(question_text: "When was  ..?", assessment_id: assessment1.assessment_id)
question12 = Question.new(question_text: "What do you think ..?", assessment_id: assessment1.assessment_id)
question13 = Question.new(question_text: "Are you eligible of ..?", assessment_id: assessment1.assessment_id)
question14 = Question.new(question_text: "Could you do ..?", assessment_id: assessment1.assessment_id)
question15 = Question.new(question_text: "What do you think of ..?", assessment_id: assessment1.assessment_id)
question16 = Question.new(question_text: "How will you ..?", assessment_id: assessment1.assessment_id)
question17 = Question.new(question_text: "Will you do ..?", assessment_id: assessment1.assessment_id)
question18 = Question.new(question_text: "What do you think ..?", assessment_id: assessment1.assessment_id)
question19 = Question.new(question_text: "When was  ..?", assessment_id: assessment1.assessment_id)
question20 = Question.new(question_text: "How often do..?", assessment_id: assessment1.assessment_id)
question21 = Question.new(question_text: "How many ..?", assessment_id: assessment1.assessment_id)
question22 = Question.new(question_text: "Where was ..?", assessment_id: assessment1.assessment_id)
question23 = Question.new(question_text: "When was  ..?", assessment_id: assessment1.assessment_id)
question24 = Question.new(question_text: "What do you think ..?", assessment_id: assessment1.assessment_id)


question1.save(:validate => false)
question2.save(:validate => false)
question3.save(:validate => false)
question4.save(:validate => false)
question5.save(:validate => false)
question6.save(:validate => false)
question7.save(:validate => false)
question8.save(:validate => false)
question9.save(:validate => false)
question10.save(:validate => false)
question11.save(:validate => false)
question12.save(:validate => false)
question13.save(:validate => false)
question14.save(:validate => false)
question15.save(:validate => false)
question16.save(:validate => false)
question17.save(:validate => false)
question18.save(:validate => false)
question19.save(:validate => false)
question20.save(:validate => false)
question21.save(:validate => false)
question22.save(:validate => false)
question23.save(:validate => false)
question24.save(:validate => false)



puts question24.inspect

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

puts answer70.inspect

#Assignment.create(complete: false,vendor_id: "1",given_task_id: "1")


#######################################################################################
#######################################################################################
#######################################################################################
#######################################################################################
##################################-LIGHT QUESTIONS-####################################
#######################################################################################
#######################################################################################
#######################################################################################
#######################################################################################

#Templates
# q = Question.new(question_text: "", assessment_id: .assessment_id)
# a = Answer.new(upload_needed: , answer_text: , additional_response: , question_id: .question_id)

light_task = Task.create(task_title: "Light Questions", task_description: "Please complete this question set", estimation: "60")

given_task_light = GivenTask.create(set_date: "2021-04-17", due_date: "2021-06-06",priority: "3", repeatable: "0", task_id: light_task.task_id)

light_assignment_vendor3 = Assignment.create(complete: "false",vendor_id: vendor3.vendor_id, given_task_id: given_task_light.given_task_id,complete_by: "2021-06-16")
light_assignment_vendor3 = Assignment.create(complete: "false",vendor_id: vendor2.vendor_id, given_task_id: given_task_light.given_task_id,complete_by: "2021-09-13")

light_assessment = Assessment.new(assessment_title: "Light Supplier Assessment")
light_assessment.save(:validate => false)

light_linker = AssessmentLinker.create(task_id: light_task.task_id, assessment_id: light_assessment.assessment_id)


#Light questions
lq1 = Question.new(question_text: "Is your organisation certified to ISO 27001?", assessment_id: light_assessment.assessment_id)
lq1.save(:validate => false)
lq1_a1 = Answer.create(upload_needed: "false", answer_text: "Not certified or aligned.", additional_response: "None.", question_id: lq1.question_id)
lq1_a2 = Answer.create(upload_needed: "true", answer_text: "Aligned, but not certified.", additional_response: "Please provide relevant evidence (e.g. plans, internal audit reports). Please provide the details of the scope.", question_id: lq1.question_id)
lq1_a3 = Answer.create(upload_needed: "true", answer_text: "Previously certified to ISO 27001, but the certification has expired or otherwise become invalid.", additional_response: "Please provide the certificate. Please provide the details of the scope.", question_id: lq1.question_id)
lq1_a4 = Answer.create(upload_needed: "true", answer_text: "Hold current, valid certification.", additional_response: "Please provide the certificate. Please provide the details of the scope." , question_id: lq1.question_id)

lq2 = Question.new(question_text: "Is your organisation certified against any other information security standards or frameworks?", assessment_id: light_assessment.assessment_id)
lq2.save(:validate => false)
lq2_a1 = Answer.create(upload_needed: "false", answer_text: "Not certified or aligned.", additional_response: "None.", question_id: lq2.question_id)
lq2_a2 = Answer.create(upload_needed: "true", answer_text: "Aligned to other standard(s) or framework(s), but not certified.", additional_response: "Please provide evidence (e.g. plans, internal audit reports). Please provide details of the standard or framework and the scope.", question_id: lq2.question_id)
lq2_a3 = Answer.create(upload_needed: "true", answer_text: "Previously certified to other standard(s) or framework(s), but the certification has expired.", additional_response: "Please provide the certificate. Please provide details of the standard or framework and the scope.", question_id: lq2.question_id)
lq2_a4 = Answer.create(upload_needed: "true", answer_text: "Hold current, valid other certification.", additional_response: "Please provide the certificate. Please provide details of the standard or framework and the scope." , question_id: lq2.question_id)

lq3 = Question.new(question_text: "Does your organisation maintain a solution diagram that shows the systems and data flows that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq3.save(:validate => false)
lq3_a1 = Answer.create(upload_needed: "false", answer_text: "No", additional_response: "None.", question_id: lq3.question_id)
lq3_a2 = Answer.create(upload_needed: "true", answer_text: "Yes", additional_response: "Please provide high level solution diagram showing <CLIENT NAME> data flow and storage. ", question_id: lq3.question_id)

lq4 = Question.new(question_text: "Does your organisation have information security role(s), with responsibilities over the systems that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq4.save(:validate => false)
lq4_a1 = Answer.create(upload_needed: "true", answer_text: "No established information security roles or information security manager.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq4.question_id)
lq4_a2 = Answer.create(upload_needed: "true", answer_text: "Yes, outsourced information security roles but no dedicated information security manager.", additional_response: "Please provide an organisation chart showing information security roles or a description.", question_id: lq4.question_id)
lq4_a3 = Answer.create(upload_needed: "true", answer_text: "Yes, internal or outsourced information security roles and a dedicated information security manager.", additional_response: "Please provide an organisation chart showing information security roles or a description.", question_id: lq4.question_id)
lq4_a4 = Answer.create(upload_needed: "true", answer_text: "Yes, multiple information security roles, a dedicated information security manager and CISO.", additional_response: "Please provide an organisation chart showing information security roles or a description." , question_id: lq4.question_id)

lq5 = Question.new(question_text: "Has your organisation undergone any internal and/or external information security audit?", assessment_id: light_assessment.assessment_id)
lq5.save(:validate => false)
lq5_a1 = Answer.create(upload_needed: "true", answer_text: "No audits have been conducted.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq5.question_id)
lq5_a2 = Answer.create(upload_needed: "true", answer_text: "Greater than 12 months.", additional_response: "Please provide the last audit report and the scope of the audit.", question_id: lq5.question_id)
lq5_a3 = Answer.create(upload_needed: "true", answer_text: "Annual audit and within the last 12 months.", additional_response: "Please provide the last audit report and the scope of the audit.", question_id: lq5.question_id)
lq5_a4 = Answer.create(upload_needed: "true", answer_text: "Bi-annual audits or greater.", additional_response: "Please provide the last audit report and the scope of the audit." , question_id: lq5.question_id)

lq6 = Question.new(question_text: "Has your organisation undergone any internal and/or external information security audit?", assessment_id: light_assessment.assessment_id)
lq6.save(:validate => false)
lq6_a1 = Answer.create(upload_needed: "true", answer_text: "No background checks conducted for all staff.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq6.question_id)
lq6_a2 = Answer.create(upload_needed: "true", answer_text: "Yes, basic checks for all staff.", additional_response: "Please provide a copy of the latest vetting policy/procedure.", question_id: lq6.question_id)
lq6_a3 = Answer.create(upload_needed: "true", answer_text: "Yes, basic checks for all staff and advanced checks for privileged users.", additional_response: "Please provide a copy of the latest vetting policy/procedure.", question_id: lq6.question_id)
lq6_a4 = Answer.create(upload_needed: "true", answer_text: "Yes, advanced checks for all users (e.g. government clearance).", additional_response: "Please provide a copy of the latest vetting policy/procedure." , question_id: lq6.question_id)

lq7 = Question.new(question_text: "Does your organisation maintain an acceptable use policy covering systems that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq6.save(:validate => false)
lq7_a1 = Answer.create(upload_needed: "true", answer_text: "No acceptable use policy.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq7.question_id)
lq7_a2 = Answer.create(upload_needed: "true", answer_text: "Yes, but in DRAFT and not widely communicated.", additional_response: "Please provide the latest acceptable use policy.", question_id: lq7.question_id)
lq7_a3 = Answer.create(upload_needed: "true", answer_text: "Yes, in DRAFT but widely communicated.", additional_response: "Please provide the latest acceptable use policy.", question_id: lq7.question_id)
lq7_a4 = Answer.create(upload_needed: "true", answer_text: "Yes approved and widely communicated.", additional_response: "Please provide the latest acceptable use policy." , question_id: lq7.question_id)

lq8 = Question.new(question_text: "Does your organisation have an information security policy and what level has it been approved at?", assessment_id: light_assessment.assessment_id)
lq8.save(:validate => false)
lq8_a1 = Answer.create(upload_needed: "true", answer_text: "No policy in place.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq8.question_id)
lq8_a2 = Answer.create(upload_needed: "true", answer_text: "Yes, but it has not been formally approved.", additional_response: "Please provide the latest information security policy.", question_id: lq8.question_id)
lq8_a3 = Answer.create(upload_needed: "true", answer_text: "Yes, approved at director level or equivalent.", additional_response: "Please provide the latest information security policy.", question_id: lq8.question_id)
lq8_a4 = Answer.create(upload_needed: "true", answer_text: "Yes, approved at board level or equivalent. ", additional_response: "Please provide the latest information security policy." , question_id: lq8.question_id)

lq9 = Question.new(question_text: "Has your organisation performed a risk assessment for systems that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq9.save(:validate => false)
lq9_a1 = Answer.create(upload_needed: "true", answer_text: "No risk assessment has been conducted.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq9.question_id)
lq9_a2 = Answer.create(upload_needed: "true", answer_text: "Yes, a single risk assessment has been conducted.", additional_response: "Please provide a copy of the risk assessment, or risk assessment methodology, and details of who performed the risk assessment and when.", question_id: lq9.question_id)
lq9_a3 = Answer.create(upload_needed: "true", answer_text: "Yes, continuous risk assessments are conducted.", additional_response: "Please provide a copy of the risk assessment, or risk assessment methodology, and details of who performed the risk assessment and when.", question_id: lq9.question_id)

lq10 = Question.new(question_text: "Does your organisation use physical entry controls to restrict (e.g. access passes) and monitor (e.g. CCTV) physical access to systems that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq10.save(:validate => false)
lq10_a1 = Answer.create(upload_needed: "true", answer_text: "No physical entry controls.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq10.question_id)
lq10_a2 = Answer.create(upload_needed: "true", answer_text: "Yes, restrict but not actively monitor.", additional_response: "Please provide details of the controls.", question_id: lq10.question_id)
lq10_a3 = Answer.create(upload_needed: "true", answer_text: "Yes, restrict and actively monitor.", additional_response: "Please provide details of the controls.", question_id: lq10.question_id)

lq11 = Question.new(question_text: "Does your organisation restrict physical access (e.g. proximity card access) to secure areas (e.g. server rooms) that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq11.save(:validate => false)
lq11_a1 = Answer.create(upload_needed: "true", answer_text: "No restricted access.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq11.question_id)
lq11_a2 = Answer.create(upload_needed: "true", answer_text: "Yes, restricted physical access.", additional_response: "Please provide details of the controls.", question_id: lq11.question_id)
lq11_a3 = Answer.create(upload_needed: "true", answer_text: "Yes, restricted physical access limited to IT.", additional_response: "Please provide details of the controls.", question_id: lq11.question_id)

lq12 = Question.new(question_text: "Does your organisation maintain an asset inventory of all hardware and software assets that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq12.save(:validate => false)
lq12_a1 = Answer.create(upload_needed: "true", answer_text: "No hardware/software asset inventory.", additional_response: "Please provide details of the compensating controls(where required)", question_id: lq12.question_id)
lq12_a2 = Answer.create(upload_needed: "true", answer_text: "Yes, but only of hardware or software (not both).", additional_response: "Please provide details of the controls.", question_id: lq12.question_id)
lq12_a3 = Answer.create(upload_needed: "true", answer_text: "Yes, an inventory of hardware and software assets updated manually.", additional_response: "Please provide details of the controls and technologies used.", question_id: lq12.question_id)
lq12_a4 = Answer.create(upload_needed: "true", answer_text: "Yes, an inventory of hardware and software assets updated automatically.", additional_response: "Please provide details of the controls and technologies used." , question_id: lq12.question_id)

lq13 = Question.new(question_text: "Does your organisation have anti-malware software installed on devices that will/currently access, store or process University of Sheffield data and is it updated regularly?", assessment_id: light_assessment.assessment_id)
lq13.save(:validate => false)
lq13_a1 = Answer.create(upload_needed: "true", answer_text: "No anti-malware software installed.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq13.question_id)
lq13_a2 = Answer.create(upload_needed: "true", answer_text: "Yes, but only on some devices.", additional_response: "Please provide details of the technologies used and the latest anti-malware policy.", question_id: lq13.question_id)
lq13_a3 = Answer.create(upload_needed: "true", answer_text: "Yes, but not updated regularly or managed centrally.", additional_response: "Please provide details of the technologies used and the latest anti-malware policy.", question_id: lq13.question_id)
lq13_a4 = Answer.create(upload_needed: "true", answer_text: "Yes, updated regularly and managed centrally.", additional_response: "Please provide details of the technologies used and the latest anti-malware policy." , question_id: lq13.question_id)

lq14 = Question.new(question_text: "Does you organisation have formal change management procedures that are followed for all changes to systems and environments that will/currently access, store or process University of Sheffield data, and is formal approval required?", assessment_id: light_assessment.assessment_id)
lq14.save(:validate => false)
lq14_a1 = Answer.create(upload_needed: "true", answer_text: "No formal change management procedures.", additional_response: "Please provide details of the compensating controls in the comment box (where required)", question_id: lq14.question_id)
lq14_a2 = Answer.create(upload_needed: "true", answer_text: "No, but some changes have to be approved.", additional_response: "Please provide details of the controls in the comment box.", question_id: lq14.question_id)
lq14_a3 = Answer.create(upload_needed: "true", answer_text: "Yes, for all changes using a manual process.", additional_response: "Please provide the latest change management procedure/policy.", question_id: lq14.question_id)
lq14_a4 = Answer.create(upload_needed: "true", answer_text: "Yes, for all changes using a change management tool.", additional_response: "Please provide the latest change management procedure/policy and technologies used." , question_id: lq14.question_id)



# lq2.save(:validate => false)
# lq3.save(:validate => false)
# lq4.save(:validate => false)
# lq5.save(:validate => false)
# lq6.save(:validate => false)
# lq7.save(:validate => false)
# lq8.save(:validate => false)
# lq9.save(:validate => false)
# lq10.save(:validate => false)
# lq11.save(:validate => false)
# lq12.save(:validate => false)
# lq13.save(:validate => false)
# lq14.save(:validate => false)