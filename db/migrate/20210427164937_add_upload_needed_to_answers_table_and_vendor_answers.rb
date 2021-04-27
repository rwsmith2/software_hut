class AddUploadNeededToAnswersTableAndVendorAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :upload_needed, :boolean
    add_column :vendor_answers, :vendor_upload, :binary, null: true
  end
end
