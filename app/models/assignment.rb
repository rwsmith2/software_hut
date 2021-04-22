# == Schema Information
#
# Table name: assignments
#
#  complete      :boolean          default(FALSE)
#  assignment_id :integer          not null, primary key
#  given_task_id :integer          not null
#  vendor_id     :integer          not null
#
# Foreign Keys
#
#  fk_rails_...  (given_task_id => given_tasks.given_task_id) ON DELETE => cascade
#  fk_rails_...  (vendor_id => vendors.vendor_id) ON DELETE => cascade
#
class Assignment < ApplicationRecord
  has_many :vendor_answers,  dependent: :destroy
  has_many :vendor_uploads,  dependent: :destroy
  belongs_to :given_task
  belongs_to :vendor

  
end
