
# == Schema Information
#
# Table name: assessment_linkers
#
#  id            :bigint           not null, primary key
#  assessment_id :integer
#  task_id       :integer
#
# Foreign Keys
#
#  fk_rails_...  (assessment_id => assessments.assessment_id) ON DELETE => cascade
#  fk_rails_...  (task_id => tasks.task_id)
#
class AssessmentLinker < ApplicationRecord
  belongs_to :task
  belongs_to :assessment

  

end
