class CreateUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :uploads, id: false do |t|
      ##Primary Key
      t.integer :upload_id, primary_key: true
  
      t.integer :upload_type
      t.string :upload_description
  
      ##FK
      t.integer :answer_id
    
    end
    add_foreign_key :uploads, :answers, column: :answer_id,  primary_key: "answer_id", on_delete: :cascade
end