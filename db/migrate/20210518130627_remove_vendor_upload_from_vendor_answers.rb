class RemoveVendorUploadFromVendorAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :vendor_answers, :vendor_upload, :binary
  end
end
