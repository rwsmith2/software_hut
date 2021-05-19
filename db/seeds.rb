
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


#######################################################################################
#######################################################################################
#######################################################################################
#######################################################################################
######################################-TRIAGE-#########################################
#######################################################################################
#######################################################################################
#######################################################################################
#######################################################################################

triage_task = Task.create(task_title: "Triage", task_description: "Please complete this question set", estimation: "10")

given_task_triage = GivenTask.create(set_date: "2021-04-17", due_date: "2021-06-06",priority: "3", repeatable: "0", task_id: triage_task.task_id)

triage_assignment_vendor3 = Assignment.create(complete: "false",vendor_id: vendor3.vendor_id, given_task_id: given_task_triage.given_task_id,complete_by: "2021-06-16")
triage_assignment_vendor2 = Assignment.create(complete: "false",vendor_id: vendor2.vendor_id, given_task_id: given_task_triage.given_task_id,complete_by: "2021-09-13")

triage_assessment = Assessment.new(assessment_title: "Triage Assessment")
triage_assessment.save(:validate => false)

triage_linker = AssessmentLinker.create(task_id: triage_task.task_id, assessment_id: triage_assessment.assessment_id)

tq1 = Question.new(question_text: "Is your organisation certified to ISO 27001?", assessment_id: triage_assessment.assessment_id)
tq1.save(:validate => false)
tq1_a1 = Answer.create(upload_needed: "false", comment_needed: "false", answer_text: "Not certified or aligned.", additional_response: "None.", question_id: tq1.question_id)
tq1_a2 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Aligned, but not certified.", additional_response: "Please provide relevant evidence (e.g. plans, internal audit reports). Please provide the details of the scope.", question_id: tq1.question_id)
tq1_a3 = Answer.create(upload_needed: "true", comment_needed: "true",answer_text: "Previously certified to ISO 27001, but the certification has expired or otherwise become invalid.", additional_response: "Please provide the certificate. Please provide the details of the scope.", question_id: tq1.question_id)
tq1_a4 = Answer.create(upload_needed: "true", comment_needed: "true",answer_text: "Hold current, valid certification.", additional_response: "Please provide the certificate. Please provide the details of the scope." , question_id: tq1.question_id)


tq2 = Question.new(question_text: "Is your organisation certified to the Payment Card Industry Data Security Standard (PCI-DSS)?", assessment_id: triage_assessment.assessment_id)
tq2.save(:validate => false)
tq2_a1 = Answer.create(upload_needed: "false", comment_needed: "false", answer_text: "Not certified or aligned.", additional_response: "None.", question_id: tq2.question_id)
tq2_a2 = Answer.create(upload_needed: "true", comment_needed: "true", answer_text: "Aligned, but not certified.", additional_response: "Please provide evidence (e.g. plans, internal audit reports) Please provide the details of the scope.", question_id: tq2.question_id)
tq2_a3 = Answer.create(upload_needed: "false", comment_needed: "true",answer_text: "Previously certified, but the certification has expired.", additional_response: "Please provide a brief explanation in the comment box provided. Please provide the details of the scope.", question_id: tq2.question_id)
tq2_a4 = Answer.create(upload_needed: "true", comment_needed: "true",answer_text: "Hold current, valid certification.", additional_response: "Please provide most recent PCI DSS Attestation of Compliance certificate. Please provide the details of the scope." , question_id: tq2.question_id)

tq3 = Question.new(question_text: "Will you be processing Card transaction for the University?", assessment_id: triage_assessment.assessment_id)
tq3.save(:validate => false)
tq3_a1 = Answer.create(upload_needed: "false", comment_needed: "false",answer_text: "No.", additional_response: "None.", question_id: tq3.question_id)
tq3_a2 = Answer.create(upload_needed: "false", comment_needed: "false", answer_text: "Yes.", additional_response: "None.", question_id: tq3.question_id)


tq4 = Question.new(question_text: "Will you be processing any Personal Data of the University as a result of the solution/service that you are providing?", assessment_id: triage_assessment.assessment_id)
tq4.save(:validate => false)
tq4_a1 = Answer.create(upload_needed: "false", comment_needed: "false",answer_text: "No.", additional_response: "None.", question_id: tq4.question_id)
tq4_a2 = Answer.create(upload_needed: "false", comment_needed: "false", answer_text: "Yes.", additional_response: "None.", question_id: tq4.question_id)


#######################################################################################
#######################################################################################
#######################################################################################
#######################################################################################
################################-Security Screening-###################################
#######################################################################################
#######################################################################################
#######################################################################################
#######################################################################################

security_task = Task.create(task_title: "Data Protection Screening", task_description: "Please complete these security screening questions", estimation: "30")

given_task_security = GivenTask.create(set_date: "2021-04-17", due_date: "2021-06-06",priority: "2", repeatable: "0", task_id: security_task.task_id)

security_assignment_vendor3 = Assignment.create(complete: "false",vendor_id: vendor3.vendor_id, given_task_id: given_task_security.given_task_id,complete_by: "2021-06-16")
security_assignment_vendor2 = Assignment.create(complete: "false",vendor_id: vendor2.vendor_id, given_task_id: given_task_security.given_task_id,complete_by: "2021-09-13")

security_assessment = Assessment.new(assessment_title: "Data Protection Screening Assessment")
security_assessment.save(:validate => false)

security_linker = AssessmentLinker.create(task_id: security_task.task_id, assessment_id: security_assessment.assessment_id)

sq1 = Question.new(question_text: "Do you have a Data Protection Policy?", assessment_id: security_assessment.assessment_id)
sq1.save(:validate => false)
sq1_a1 = Answer.create(upload_needed: "false", comment_needed: "false", answer_text: "No, we don't have one.", additional_response: "None.", question_id: sq1.question_id)
sq1_a2 = Answer.create(upload_needed: "true", comment_needed: "true", answer_text: "Yes, we have one.", additional_response: "Please provide the policy. Please provide the details of the scope.", question_id: sq1.question_id)

sq2 = Question.new(question_text: "Are your staff trained on Data Protection/Information Security?", assessment_id: security_assessment.assessment_id)
sq2.save(:validate => false)
sq2_a1 = Answer.create(upload_needed: "false", comment_needed: "false", answer_text: "No, they aren't trained.", additional_response: "None.", question_id: sq2.question_id)
sq2_a2 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, they are trained.", additional_response: "Please provide the details in the comment box.", question_id: sq2.question_id)

sq3 = Question.new(question_text: "Do you have a data breach management procedure?", assessment_id: security_assessment.assessment_id)
sq3.save(:validate => false)
sq3_a1 = Answer.create(upload_needed: "false", comment_needed: "false", answer_text: "No, we don't have one.", additional_response: "None.", question_id: sq3.question_id)
sq3_a2 = Answer.create(upload_needed: "true", comment_needed: "false", answer_text: "Yes, we have one.", additional_response: "Please provide the procedure.", question_id: sq3.question_id)

sq4 = Question.new(question_text: "What data will you be processing?", assessment_id: security_assessment.assessment_id)
sq4.save(:validate => false)
sq4_a1 = Answer.create(upload_needed: "false", comment_needed: "false", answer_text: "No, we don't need to process data.", additional_response: "None.", question_id: sq4.question_id)
sq4_a2 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, I will give the information in the next section.", additional_response: "Please provide the details of the data you are processing.", question_id: sq4.question_id)

sq5 = Question.new(question_text: "How do you ensure security of our data?", assessment_id: security_assessment.assessment_id)
sq5.save(:validate => false)
sq5_a1 = Answer.create(upload_needed: "false", comment_needed: "false", answer_text: "No, we cannot ensure the security.", additional_response: "None.", question_id: sq5.question_id)
sq5_a2 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, I will give the information in the next section.", additional_response: "Please provide the details in the comment box.", question_id: sq5.question_id)

sq6 = Question.new(question_text: "Do you use any sub processors and if so where are they located?", assessment_id: security_assessment.assessment_id)
sq6.save(:validate => false)
sq6_a1 = Answer.create(upload_needed: "false", comment_needed: "false", answer_text: "No, we don't have any.", additional_response: "None.", question_id: sq6.question_id)
sq6_a2 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, I will give the information in the next section.", additional_response: "Please provide the details in the comment box.", question_id: sq6.question_id)

sq7 = Question.new(question_text: "What happens to the data when the agreement ends? / Do you agree to the University's standard Exit Plan Terms?", assessment_id: security_assessment.assessment_id)
sq7.save(:validate => false)
sq7_a1 = Answer.create(upload_needed: "false", comment_needed: "false", answer_text: "No, we don't know.", additional_response: "None.", question_id: sq7.question_id)
sq7_a2 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, I will give the information in the next section.", additional_response: "Please provide the details in the comment box.", question_id: sq7.question_id)


#######################################################################################
#######################################################################################
#######################################################################################
#######################################################################################
##################################-LIGHT QUESTIONS-####################################
#######################################################################################
#######################################################################################
#######################################################################################
#######################################################################################

light_task = Task.create(task_title: "Light Questions", task_description: "Please complete this question set", estimation: "60")

given_task_light = GivenTask.create(set_date: "2021-04-17", due_date: "2021-06-06",priority: "2", repeatable: "0", task_id: light_task.task_id)

light_assignment_vendor3 = Assignment.create(complete: "false",vendor_id: vendor3.vendor_id, given_task_id: given_task_light.given_task_id,complete_by: "2021-06-16")
light_assignment_vendor2 = Assignment.create(complete: "false",vendor_id: vendor2.vendor_id, given_task_id: given_task_light.given_task_id,complete_by: "2021-09-13")

light_assessment = Assessment.new(assessment_title: "Light Supplier Assessment")
light_assessment.save(:validate => false)

light_linker = AssessmentLinker.create(task_id: light_task.task_id, assessment_id: light_assessment.assessment_id)


#Light questions
lq1 = Question.new(question_text: "Is your organisation certified to ISO 27001?", assessment_id: light_assessment.assessment_id)
lq1.save(:validate => false)
lq1_a1 = Answer.create(upload_needed: "false", comment_needed: "false", answer_text: "Not certified or aligned.", additional_response: "None.", question_id: lq1.question_id)
lq1_a2 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Aligned, but not certified.", additional_response: "Please provide relevant evidence (e.g. plans, internal audit reports). Please provide the details of the scope.", question_id: lq1.question_id)
lq1_a3 = Answer.create(upload_needed: "true", comment_needed: "true",answer_text: "Previously certified to ISO 27001, but the certification has expired or otherwise become invalid.", additional_response: "Please provide the certificate. Please provide the details of the scope.", question_id: lq1.question_id)
lq1_a4 = Answer.create(upload_needed: "true", comment_needed: "true",answer_text: "Hold current, valid certification.", additional_response: "Please provide the certificate. Please provide the details of the scope." , question_id: lq1.question_id)

lq2 = Question.new(question_text: "Is your organisation certified against any other information security standards or frameworks?", assessment_id: light_assessment.assessment_id)
lq2.save(:validate => false)
lq2_a1 = Answer.create(upload_needed: "false", comment_needed: "false",answer_text: "Not certified or aligned.", additional_response: "None.", question_id: lq2.question_id)
lq2_a2 = Answer.create(upload_needed: "true",comment_needed: "true", answer_text: "Aligned to other standard(s) or framework(s), but not certified.", additional_response: "Please provide evidence (e.g. plans, internal audit reports). Please provide details of the standard or framework and the scope.", question_id: lq2.question_id)
lq2_a3 = Answer.create(upload_needed: "true", comment_needed: "true", answer_text: "Previously certified to other standard(s) or framework(s), but the certification has expired.", additional_response: "Please provide the certificate. Please provide details of the standard or framework and the scope.", question_id: lq2.question_id)
lq2_a4 = Answer.create(upload_needed: "true", comment_needed: "true", answer_text: "Hold current, valid other certification.", additional_response: "Please provide the certificate. Please provide details of the standard or framework and the scope." , question_id: lq2.question_id)

lq3 = Question.new(question_text: "Does your organisation maintain a solution diagram that shows the systems and data flows that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq3.save(:validate => false)
lq3_a1 = Answer.create(upload_needed: "false", comment_needed: "false", answer_text: "No", additional_response: "None.", question_id: lq3.question_id)
lq3_a2 = Answer.create(upload_needed: "true", comment_needed: "false", answer_text: "Yes", additional_response: "Please provide high level solution diagram showing <CLIENT NAME> data flow and storage. ", question_id: lq3.question_id)

lq4 = Question.new(question_text: "Does your organisation have information security role(s), with responsibilities over the systems that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq4.save(:validate => false)
lq4_a1 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "No established information security roles or information security manager.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq4.question_id)
lq4_a2 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, outsourced information security roles but no dedicated information security manager.", additional_response: "Please provide an organisation chart showing information security roles or a description.", question_id: lq4.question_id)
lq4_a3 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, internal or outsourced information security roles and a dedicated information security manager.", additional_response: "Please provide an organisation chart showing information security roles or a description.", question_id: lq4.question_id)
lq4_a4 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, multiple information security roles, a dedicated information security manager and CISO.", additional_response: "Please provide an organisation chart showing information security roles or a description." , question_id: lq4.question_id)

lq5 = Question.new(question_text: "Has your organisation undergone any internal and/or external information security audit?", assessment_id: light_assessment.assessment_id)
lq5.save(:validate => false)
lq5_a1 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "No audits have been conducted.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq5.question_id)
lq5_a2 = Answer.create(upload_needed: "true", comment_needed: "true", answer_text: "Greater than 12 months.", additional_response: "Please provide the last audit report and the scope of the audit.", question_id: lq5.question_id)
lq5_a3 = Answer.create(upload_needed: "true", comment_needed: "true", answer_text: "Annual audit and within the last 12 months.", additional_response: "Please provide the last audit report and the scope of the audit.", question_id: lq5.question_id)
lq5_a4 = Answer.create(upload_needed: "true", comment_needed: "true", answer_text: "Bi-annual audits or greater.", additional_response: "Please provide the last audit report and the scope of the audit." , question_id: lq5.question_id)

lq6 = Question.new(question_text: "Has your organisation undergone any internal and/or external information security audit?", assessment_id: light_assessment.assessment_id)
lq6.save(:validate => false)
lq6_a1 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "No background checks conducted for all staff.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq6.question_id)
lq6_a2 = Answer.create(upload_needed: "true",  comment_needed: "false", answer_text: "Yes, basic checks for all staff.", additional_response: "Please provide a copy of the latest vetting policy/procedure.", question_id: lq6.question_id)
lq6_a3 = Answer.create(upload_needed: "true", comment_needed: "false", answer_text: "Yes, basic checks for all staff and advanced checks for privileged users.", additional_response: "Please provide a copy of the latest vetting policy/procedure.", question_id: lq6.question_id)
lq6_a4 = Answer.create(upload_needed: "true", comment_needed: "false", answer_text: "Yes, advanced checks for all users (e.g. government clearance).", additional_response: "Please provide a copy of the latest vetting policy/procedure." , question_id: lq6.question_id)

lq7 = Question.new(question_text: "Does your organisation maintain an acceptable use policy covering systems that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq6.save(:validate => false)
lq7_a1 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "No acceptable use policy.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq7.question_id)
lq7_a2 = Answer.create(upload_needed: "true", comment_needed: "false", answer_text: "Yes, but in DRAFT and not widely communicated.", additional_response: "Please provide the latest acceptable use policy.", question_id: lq7.question_id)
lq7_a3 = Answer.create(upload_needed: "true", comment_needed: "false", answer_text: "Yes, in DRAFT but widely communicated.", additional_response: "Please provide the latest acceptable use policy.", question_id: lq7.question_id)
lq7_a4 = Answer.create(upload_needed: "true", comment_needed: "false", answer_text: "Yes approved and widely communicated.", additional_response: "Please provide the latest acceptable use policy." , question_id: lq7.question_id)

lq8 = Question.new(question_text: "Does your organisation have an information security policy and what level has it been approved at?", assessment_id: light_assessment.assessment_id)
lq8.save(:validate => false)
lq8_a1 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "No policy in place.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq8.question_id)
lq8_a2 = Answer.create(upload_needed: "true", comment_needed: "false", answer_text: "Yes, but it has not been formally approved.", additional_response: "Please provide the latest information security policy.", question_id: lq8.question_id)
lq8_a3 = Answer.create(upload_needed: "true", comment_needed: "false", answer_text: "Yes, approved at director level or equivalent.", additional_response: "Please provide the latest information security policy.", question_id: lq8.question_id)
lq8_a4 = Answer.create(upload_needed: "true", comment_needed: "false", answer_text: "Yes, approved at board level or equivalent. ", additional_response: "Please provide the latest information security policy." , question_id: lq8.question_id)

lq9 = Question.new(question_text: "Has your organisation performed a risk assessment for systems that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq9.save(:validate => false)
lq9_a1 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "No risk assessment has been conducted.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq9.question_id)
lq9_a2 = Answer.create(upload_needed: "true", comment_needed: "true", answer_text: "Yes, a single risk assessment has been conducted.", additional_response: "Please provide a copy of the risk assessment, or risk assessment methodology, and details of who performed the risk assessment and when.", question_id: lq9.question_id)
lq9_a3 = Answer.create(upload_needed: "true", comment_needed: "true", answer_text: "Yes, continuous risk assessments are conducted.", additional_response: "Please provide a copy of the risk assessment, or risk assessment methodology, and details of who performed the risk assessment and when.", question_id: lq9.question_id)

lq10 = Question.new(question_text: "Does your organisation use physical entry controls to restrict (e.g. access passes) and monitor (e.g. CCTV) physical access to systems that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq10.save(:validate => false)
lq10_a1 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "No physical entry controls.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq10.question_id)
lq10_a2 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, restrict but not actively monitor.", additional_response: "Please provide details of the controls.", question_id: lq10.question_id)
lq10_a3 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, restrict and actively monitor.", additional_response: "Please provide details of the controls.", question_id: lq10.question_id)

lq11 = Question.new(question_text: "Does your organisation restrict physical access (e.g. proximity card access) to secure areas (e.g. server rooms) that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq11.save(:validate => false)
lq11_a1 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "No restricted access.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq11.question_id)
lq11_a2 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, restricted physical access.", additional_response: "Please provide details of the controls.", question_id: lq11.question_id)
lq11_a3 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, restricted physical access limited to IT.", additional_response: "Please provide details of the controls.", question_id: lq11.question_id)

lq12 = Question.new(question_text: "Does your organisation maintain an asset inventory of all hardware and software assets that will/currently access, store or process University of Sheffield data?", assessment_id: light_assessment.assessment_id)
lq12.save(:validate => false)
lq12_a1 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "No hardware/software asset inventory.", additional_response: "Please provide details of the compensating controls(where required)", question_id: lq12.question_id)
lq12_a2 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, but only of hardware or software (not both).", additional_response: "Please provide details of the controls.", question_id: lq12.question_id)
lq12_a3 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, an inventory of hardware and software assets updated manually.", additional_response: "Please provide details of the controls and technologies used.", question_id: lq12.question_id)
lq12_a4 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, an inventory of hardware and software assets updated automatically.", additional_response: "Please provide details of the controls and technologies used." , question_id: lq12.question_id)

lq13 = Question.new(question_text: "Does your organisation have anti-malware software installed on devices that will/currently access, store or process University of Sheffield data and is it updated regularly?", assessment_id: light_assessment.assessment_id)
lq13.save(:validate => false)
lq13_a1 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "No anti-malware software installed.", additional_response: "Please provide details of the compensating controls (where required)", question_id: lq13.question_id)
lq13_a2 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, but only on some devices.", additional_response: "Please provide details of the technologies used and the latest anti-malware policy.", question_id: lq13.question_id)
lq13_a3 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, but not updated regularly or managed centrally.", additional_response: "Please provide details of the technologies used and the latest anti-malware policy.", question_id: lq13.question_id)
lq13_a4 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "Yes, updated regularly and managed centrally.", additional_response: "Please provide details of the technologies used and the latest anti-malware policy." , question_id: lq13.question_id)

lq14 = Question.new(question_text: "Does you organisation have formal change management procedures that are followed for all changes to systems and environments that will/currently access, store or process University of Sheffield data, and is formal approval required?", assessment_id: light_assessment.assessment_id)
lq14.save(:validate => false)
lq14_a1 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "No formal change management procedures.", additional_response: "Please provide details of the compensating controls in the comment box (where required)", question_id: lq14.question_id)
lq14_a2 = Answer.create(upload_needed: "false", comment_needed: "true", answer_text: "No, but some changes have to be approved.", additional_response: "Please provide details of the controls in the comment box.", question_id: lq14.question_id)
lq14_a3 = Answer.create(upload_needed: "true", comment_needed: "true", answer_text: "Yes, for all changes using a manual process.", additional_response: "Please provide the latest change management procedure/policy.", question_id: lq14.question_id)
lq14_a4 = Answer.create(upload_needed: "true", comment_needed: "true", answer_text: "Yes, for all changes using a change management tool.", additional_response: "Please provide the latest change management procedure/policy and technologies used." , question_id: lq14.question_id)


