class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.references :channel
      t.references :user

      t.timestamps
    end
    add_index :messages, :channel_id
    add_index :messages, :user_id
  end
end
