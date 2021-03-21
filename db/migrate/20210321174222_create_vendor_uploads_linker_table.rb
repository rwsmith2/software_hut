class CreateVendorUploadsLinkerTable < ActiveRecord::Migration[6.0]
  def change
    create_table :vendor_uploads_linker_tables do |t|
        t.integer :given_task_id
        t.integer :upload_id
        t.binary :data
    end

    add_foreign_key :vendor_uploads_linker_tables, :uploads, column: :upload_id, primary_key: "upload_id"
    add_foreign_key :vendor_uploads_linker_tables, :given_task, column: :given_task_id, primary_key: "given_task_id", on_delete: :cascade

  end
end
