class ChangeAnswerFkToCascade < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :answers, :questions
    add_foreign_key :answers, :questions, column: :question_id,  primary_key: "question_id", on_delete: :cascade
  end
end
