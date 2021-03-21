class CreateAssessments < ActiveRecord::Migration[6.0]
  def change
    create_table :assessments, id: false do |t|
        ##Primary Key
        t.integer :assessment_id, primary_key: true

        t.string :assessment_title, null: false
    end
  end
end
