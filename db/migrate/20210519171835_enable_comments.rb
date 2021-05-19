class EnableComments < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :comment_needed, :boolean, null: true
    add_column :vendor_answers, :comment, :string, null: true

  end
end
