# == Schema Information
#
# Table name: assessments
#
#  assessment_title :string           not null
#  assessment_id    :integer          not null, primary key
#
require 'rails_helper'

RSpec.describe Assessment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  user = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
  Admin.create(user_id: user.user_id)

  task = Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1")
  assesment = Assessment.create(assessment_title: "Triage questions")
  question = Question.create(question_text: "Are you eligible of ..?", assessment_id: assesment.assessment_id)
  answer = Answer.create(additional_response: "Good",answer_text: "Yes", question_id: question.question_id)
  given_task = GivenTask.create(set_date: "2021-04-25", due_date: "2021-05-01",priority: "2",repeatable: "7", task_id: task.task_id)

  assesmentLinker = AssessmentLinker.create(task_id: task.task_id, assessment_id: assesment.assessment_id)

  describe "#assessment_title" do
    it 'can retrieve assessment_title' do
      expect(assesment.assessment_title).to eq "Triage questions"
    end
  end

  describe "#assessment_id" do
    it 'has an assessment_id' do
      expect(assesment.assessment_id).to eq assesment.assessment_id
    end
  end
end
