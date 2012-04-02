class CreateChannelsUsers < ActiveRecord::Migration
  def change
    create_table :channels_users do |t|
      t.integer :channel_id
      t.integer :user_id

      t.timestamps
    end
  end
end
