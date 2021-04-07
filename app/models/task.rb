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
class Task < ApplicationRecord
    has_many :assessment_linker
    validates :task_title, :task_description, :estimation, presence: true

end
