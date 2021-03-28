class AddingForeignToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :user_id, :integer

    add_foreign_key :admins, :users, column: :user_id,  primary_key: "user_id", on_delete: :cascade
  end
end
