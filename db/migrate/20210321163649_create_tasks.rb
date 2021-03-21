class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks, id: false do |t|
      ##Primary Key
      t.integer :task_id, primary_key: true

      t.string :task_title, null: false
      t.string :task_description
      t.integer :upload_type, null: false
      t.integer :estimation, null: false
      t.integer :admin_id
    end

    add_foreign_key :tasks, :admins, column: :admin_id,  primary_key: "admin_id"
  end
end
