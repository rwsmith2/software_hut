class ChangeGivenTaskToGivenTasks < ActiveRecord::Migration[6.0]
  def change
    rename_table :given_task, :given_tasks
  end
end
