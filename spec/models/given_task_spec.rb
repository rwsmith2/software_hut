# == Schema Information
#
# Table name: given_tasks
#
#  due_date      :date             not null
#  priority      :integer
#  repeatable    :integer          not null
#  set_date      :date             not null
#  given_task_id :integer          not null, primary key
#  task_id       :bigint
#
# Indexes
#
#  index_given_tasks_on_task_id  (task_id)
#
# Foreign Keys
#
#  fk_rails_...  (task_id => tasks.task_id) ON DELETE => cascade
#
require 'rails_helper'

RSpec.describe GivenTask, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
    user = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
    Admin.create(user_id: user.user_id)
    task = Task.create(task_title: "Example Task 1", task_description: "A nice Task", estimation: "1", user_id: user.user_id)
  
    assesment = Assessment.create(assessment_title: "Triage questions")
    question = Question.create(question_text: "Are you eligible of ..?", assessment_id: assesment.assessment_id)
    answer = Answer.create(additional_response: "Good",answer_text: "Yes", question_id: question.question_id)
    given_task = GivenTask.create(set_date: "2021-04-25", due_date: "2021-05-01",priority: "2",repeatable: "7", task_id: task.task_id)

  describe "#due_date" do
    it 'can retrieve due_date' do
      expect(given_task.due_date).to eq Date.strptime("{ 2021, 5, 1 }", "{ %Y, %m, %d }")
    end
  end

  describe "#set_date" do
    it 'can retrieve set_date' do
      expect(given_task.set_date).to eq Date.strptime("{ 2021, 4, 25 }", "{ %Y, %m, %d }")
    end
  end

  describe "#priority" do
    it 'can retrieve priority' do
      expect(given_task.priority).to eq 2
    end
  end

  describe "#repeatable" do
    it 'can retrieve repeatable' do
      expect(given_task.repeatable).to eq 7
    end
  end
  
  describe "#given_task_id" do
    it 'has a given_task_id' do
      expect(given_task.given_task_id).to eq given_task.given_task_id
    end
  end

  describe "#task_id" do
    it 'can retrieve task_id' do
      expect(given_task.task_id).to eq task.task_id
    end
  end

  #Testing priority_int_to_string function
  describe '#priority_int_to_string' do

    it 'convert 0 to low' do 
      string = GivenTask.priority_int_to_string(0)
      expect(string).to eq "Low"
    end

    it 'convert 2 to high' do 
      string = GivenTask.priority_int_to_string(2)
      expect(string).to eq "High"
    end

    it 'convert random number to medium' do 
      string = GivenTask.priority_int_to_string(23423)
      expect(string).to eq "Medium"
    end

    it 'convert negative to medium' do 
      string = GivenTask.priority_int_to_string(-95)
      expect(string).to eq "Medium"
    end

  end

  #Testing priority_string_to_int function
  describe '#priority_string_to_int' do

    it 'convert Low to 0' do 
      string = GivenTask.priority_string_to_int("Low")
      expect(string).to eq 0
    end

    it 'convert High to 2' do 
      string = GivenTask.priority_string_to_int("High")
      expect(string).to eq 2
    end

    it 'convert Medium to 1' do 
      string = GivenTask.priority_string_to_int("Medium")
      expect(string).to eq 1
    end

    it 'convert random word to 1' do 
      string = GivenTask.priority_string_to_int("RANDOM")
      expect(string).to eq 1
    end

    it 'convert number to 1' do 
      string = GivenTask.priority_string_to_int(234234)
      expect(string).to eq 1
    end

  end

  #Testing if_empty_repeatable_set_to_0 method
  describe '#if_empty_repeatable_set_to_0' do

    it 'input non-zero number and returns the same number' do 
      output = GivenTask.if_empty_repeatable_set_to_0(5)
      expect(output).to eq 5
    end

    it 'input zero and returns zero' do 
      output = GivenTask.if_empty_repeatable_set_to_0(0)
      expect(output).to eq 0
    end

    it 'input blank string and return 0' do 
      output = GivenTask.if_empty_repeatable_set_to_0("")
      expect(output).to eq 0
    end

  end

end
  







