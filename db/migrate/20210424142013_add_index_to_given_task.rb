class AddIndexToGivenTask < ActiveRecord::Migration[6.0]
  def change
    add_index :given_tasks, :task_id
  end
end
