class MakeUploadNeededDefaultToFalse < ActiveRecord::Migration[6.0]
  def change
    change_column_default :answers, :upload_needed, false
  end
end
