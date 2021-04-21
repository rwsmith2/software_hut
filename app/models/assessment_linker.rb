
# == Schema Information
#
# Table name: assessment_linkers
#
#  id            :integer          not null, primary key
#  assessment_id :integer
#  task_id       :integer
#
# Foreign Keys
#
#  assessment_id  (assessment_id => assessments.assessment_id) ON DELETE => cascade
#  task_id        (task_id => tasks.task_id)
#
class AssessmentLinker < ApplicationRecord
  belongs_to :task
  belongs_to :assessment
end
