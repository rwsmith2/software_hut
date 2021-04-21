class AddPkToAddresses < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE addresses ADD PRIMARY KEY (vendor_id);"
  end
end
