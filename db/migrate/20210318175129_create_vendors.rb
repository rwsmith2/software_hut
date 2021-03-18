class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :company_name, null: false
      t.integer :company_number, null: false
      t.boolean :validated, :default => false
      t.integer :initial_score
      t.integer :credit_rating
      t.integer :kpi
      t.integer :risk_rating

    end
  end
end
