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

#Unit tests for the GivenTask model
describe GivenTask do

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
  







