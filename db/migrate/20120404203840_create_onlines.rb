class CreateOnlines < ActiveRecord::Migration
  def change
    create_table :onlines do |t|
      t.references :channel
      t.references :user

      t.timestamps
    end
    add_index :onlines, :channel_id
    add_index :onlines, :user_id
  end
end
