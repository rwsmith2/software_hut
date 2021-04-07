class EditTasksTable < ActiveRecord::Migration[6.0]
  def change
    #Remove foreign key constraint for admin_id and remove from the table
    remove_foreign_key :tasks, :admins
    remove_column  :tasks, :admin_id
    #Add user_id column and make it a foreign key
    add_column :tasks, :user_id, :integer
    add_foreign_key :tasks, :users, column: :user_id,  primary_key: "user_id"

    #Remove upload type column
    remove_column :tasks, :upload_type
  end
end
