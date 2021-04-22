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
class GivenTask < ApplicationRecord
    belongs_to :task
    has_many :assignments,  dependent: :destroy
    accepts_nested_attributes_for :assignments, allow_destroy: true

    validates :due_date, :repeatable, :priority, presence: true
    #validates :priority, allow_blank: false

    def self.priorityIntToString(integer_input)
      case integer_input
      when 0
        return "Low"
      when 2
        return "High"
      else
        return "Medium"
      end
    end


    def self.priorityStringToInt(string_input)
      case string_input
      when "Low"
        return 0
      when "High"
        return 2
      else 
        return 1
      end
    end

    def self.ifEmptyRepeatableSetTo0(repeatable_input)
      if(repeatable_input=="")
        return 0
      end
      return repeatable_input
    end


end
