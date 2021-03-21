class RenamingLinkerTables < ActiveRecord::Migration[6.0]
  def change
    rename_table :assessment_linker_tables, :assessment_linker
    rename_table :vendor_uploads_linker_tables, :vendor_uploads
  end
end
