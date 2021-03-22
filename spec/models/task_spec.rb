# == Schema Information
#
# Table name: tasks
#
#  estimation       :integer          not null
#  task_description :string
#  task_title       :string           not null
#  upload_type      :integer          not null
#  admin_id         :integer
#  task_id          :integer          not null, primary key
#
# Foreign Keys
#
#  fk_rails_...  (admin_id => admins.admin_id)
#
require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
