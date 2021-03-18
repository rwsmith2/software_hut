class AddingForeignToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :vendor_id, :integer
    add_foreign_key :addresses, :vendors, column: :vendor_id,  primary_key: "vendor_id", on_delete: :cascade
  end
end
