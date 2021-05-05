class AddCompleteByToAssignment < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :complete_by, :date, null: true
  end
end
