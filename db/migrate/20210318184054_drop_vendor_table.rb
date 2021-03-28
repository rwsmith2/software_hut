class DropVendorTable < ActiveRecord::Migration[6.0]
  def change
    def up
      drop_table :vendors
    end
  
    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
