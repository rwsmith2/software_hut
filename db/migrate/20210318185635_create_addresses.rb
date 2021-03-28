class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses, id: false do |t|
      t.string :house_name, null: false
      t.string :city_town, null: false
      t.string :country, null: false
      t.string :postcode, null: false

    end
    
  end
end
