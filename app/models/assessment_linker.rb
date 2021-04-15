class AssessmentLinker < ApplicationRecord
  belongs_to :task
  belongs_to :assessment
end
