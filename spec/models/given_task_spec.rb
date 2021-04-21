# == Schema Information
#
# Table name: given_tasks
#
#  due_date      :date             not null
#  priority      :integer
#  repeatable    :integer          not null
#  set_date      :date             not null
#  given_task_id :integer          not null, primary key
#  task_id       :integer
#
# Foreign Keys
#
#  task_id  (task_id => tasks.task_id) ON DELETE => cascade
#  task_id  (task_id => tasks.task_id) ON DELETE => cascade
#
require 'rails_helper'

RSpec.describe GivenTask, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
