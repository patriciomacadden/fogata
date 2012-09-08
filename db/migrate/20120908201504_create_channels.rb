class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.string :current_topic
      t.string :slug

      t.timestamps
    end
    add_index :channels, :name, :unique => true
    add_index :channels, :slug, :unique => true
  end
end
