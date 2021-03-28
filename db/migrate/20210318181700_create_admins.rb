class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins, id: false do |t|
      t.integer :admin_id, primary_key: true

    end
  end
end
