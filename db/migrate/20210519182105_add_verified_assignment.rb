class AddVerifiedAssignment < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :verified, :boolean, default: false
  end
end
