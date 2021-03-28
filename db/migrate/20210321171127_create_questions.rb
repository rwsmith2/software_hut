class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions, id: false do |t|
        ##Primary Key
        t.integer :question_id, primary_key: true

        t.string :question_text, null: false
        t.integer :assessment_id
      
    end
    add_foreign_key :questions, :assessments, column: :assessment_id,  primary_key: "assessment_id"
  end
end
