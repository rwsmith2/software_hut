class DeleteQuestionTextColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column  :given_task, :question_text
  end
end
