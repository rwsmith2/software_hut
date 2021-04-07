# == Schema Information
#
# Table name: tasks
#
#  estimation       :integer          not null
#  task_description :string
#  task_title       :string           not null
#  task_id          :integer          not null, primary key
#  user_id          :integer
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.user_id)
#
require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
