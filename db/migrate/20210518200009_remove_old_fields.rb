class RemoveOldFields < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :user_id, :integer
    drop_table :vendor_uploads
    drop_table :uploads
  end
end
