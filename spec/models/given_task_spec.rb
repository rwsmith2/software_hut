# == Schema Information
#
# Table name: given_tasks
#
#  complete      :boolean          default(FALSE)
#  due_date      :date             not null
#  priority      :integer
#  repeatable    :integer          not null
#  set_date      :date             not null
#  given_task_id :integer          not null, primary key
#  task_id       :integer
#  vendor_id     :integer
#
# Foreign Keys
#
#  fk_rails_...  (task_id => tasks.task_id) ON DELETE => cascade
#  fk_rails_...  (vendor_id => vendors.vendor_id) ON DELETE => cascade
#
require 'rails_helper'

RSpec.describe GivenTask, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
