class RemoveCompleteFromGivenTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column  :given_tasks, :complete

  end
end
