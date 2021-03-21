class CreateAssessmentLinkerTable < ActiveRecord::Migration[6.0]
  def change
    create_table :assessment_linker_tables do |t|
      t.integer :task_id
      t.integer :assessment_id
    end
    add_foreign_key :assessment_linker_tables, :tasks, column: :task_id, primary_key: "task_id"
    add_foreign_key :assessment_linker_tables, :assessments, column: :assessment_id, primary_key: "assessment_id", on_delete: :cascade
  end
end
