class AddForeignTaskToGivenTask < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :given_tasks, :tasks, column: :task_id,  primary_key: "task_id", on_delete: :cascade
  end
end
