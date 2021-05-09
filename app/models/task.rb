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
  has_one :assessment_linker,  dependent: :destroy
  has_many :given_task, dependent: :destroy


  accepts_nested_attributes_for :assessment_linker, allow_destroy: true
  validates :task_title, :estimation, presence: true
  validates :task_title, length: { in: 5..100}, uniqueness: { case_sensitive: false }
  validates :estimation, numericality: { only_integer: true, greater_than: 0 }

end
