class AddUploadIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :upload_id, :integer

  end
end
