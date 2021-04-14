class ChangeAssessmentLinkerTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :assessment_linker, :assessment_linkers
  end
end
