class RemoveForeignKeys < ActiveRecord::Migration[6.0]
  def change
    #remove_foreign_key :given_tasks, :vendors
    remove_column  :given_tasks, :vendor_id

    remove_foreign_key :vendor_answers, :given_tasks
    remove_column  :vendor_answers, :given_task_id


    remove_foreign_key :vendor_uploads, :given_tasks
    remove_column  :vendor_uploads, :given_task_id
  end
end
