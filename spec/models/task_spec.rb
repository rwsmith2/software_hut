# == Schema Information
#
# Table name: tasks
#
#  estimation       :integer          not null
#  task_description :string
#  task_title       :string           not null
#  task_id          :integer          not null, primary key
#
require 'rails_helper'

RSpec.describe Task, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # Admin User
  user = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
  Admin.create(user_id: user.user_id)
  task = Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: user.user_id)

  assesment = Assessment.create(assessment_title: "Triage questions")
  question = Question.create(question_text: "Are you eligible of ..?", assessment_id: assesment.assessment_id)
  answer = Answer.create(additional_response: "Good",answer_text: "Yes", question_id: question.question_id)

  AssessmentLinker.create(task_id: task.task_id, assessment_id: assesment.assessment_id)
  GivenTask.create(set_date: "2021-04-25", due_date: "2021-05-01",priority: "2",repeatable: "7", task_id: task.task_id)

  describe "#estimation" do
    it 'can retrieve estimation' do
      expect(task.estimation).to eq 1
    end
  end

  describe "#task_description" do
    it 'can retrieve task_description' do
      expect(task.task_description).to eq "A nice Task"
    end
  end

  describe "#task_title" do
    it 'can retrieve task_title' do
      expect(task.task_title).to eq "Example Task 1"
    end
  end

  describe "#task_id" do
    it 'has task_id' do
      expect(task.task_id).to eq task.task_id
    end
  end

  describe "#user_id" do
    it 'can retrieve user_id' do
      expect(task.user_id).to eq user.user_id
    end
  end
end
