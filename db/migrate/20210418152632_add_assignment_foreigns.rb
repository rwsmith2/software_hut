class AddAssignmentForeigns < ActiveRecord::Migration[6.0]
  def change
    add_column :vendor_answers, :assignment_id, :integer
    add_column :vendor_uploads, :assignment_id, :integer

    add_foreign_key :vendor_answers, :assignments, column: :assignment_id,  primary_key: "assignment_id", on_delete: :cascade
    add_foreign_key :vendor_uploads, :assignments, column: :assignment_id,  primary_key: "assignment_id", on_delete: :cascade
  end
end
