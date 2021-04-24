class ChangeTaskIdInGivenTasks < ActiveRecord::Migration[6.0]
  def change
    change_column :given_tasks, :task_id, :bigint
  end
end
