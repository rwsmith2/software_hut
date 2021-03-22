class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers, id: false do |t|
      ##Primary Key
      t.integer :answer_id, primary_key: true

      t.string :answer_text, null: false
      t.string :additional_response
	    t.integer :question_id
    end

    add_foreign_key :answers, :questions, column: :question_id,  primary_key: "question_id"
 end
end
