class CreateVendorAnswersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :vendor_answers do |t|
      ##FK
      t.integer :given_task_id
      t.integer :answer_id
    end
    add_foreign_key :vendor_answers, :answers, column: :answer_id,  primary_key: "answer_id"
    add_foreign_key :vendor_answers, :given_task, column: :given_task_id,  primary_key: "given_task_id", on_delete: :cascade
  end
end
