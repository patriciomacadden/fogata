class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :upload
      t.references :user
      t.references :channel

      t.timestamps
    end
    add_index :uploads, :user_id
    add_index :uploads, :channel_id
  end
end
