class CreateGivenTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :given_task, id: false do |t|
        ##Primary Key
        t.integer :given_task_id, primary_key: true
		
		    t.date :set_date, null: false
		    t.date :due_date, null: false
		    t.integer :priority
		    t.integer :repeatable, null: false
		    t.boolean :complete, default: false
        t.string :question_text, null: false
        
		
		    ##Foreign Key
		    t.integer :vendor_id
		    t.integer :task_id
      
    end
    add_foreign_key :given_task, :vendors, column: :vendor_id,  primary_key: "vendor_id", on_delete: :cascade
	  add_foreign_key :given_task, :tasks, column: :task_id,  primary_key: "task_id", on_delete: :cascade
  end
end
