class AddAssignedTable < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments, id: false do |t|
      t.integer :assignment_id, primary_key: true
      t.boolean :complete, default: false
      t.integer :vendor_id, null: false
      t.integer :given_task_id, null: false
    end
    add_foreign_key :assignments, :vendors, column: :vendor_id,  primary_key: "vendor_id", on_delete: :cascade
    add_foreign_key :assignments, :given_tasks, column: :given_task_id,  primary_key: "given_task_id", on_delete: :cascade
  end
end
