class AddCurrentTopicToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :current_topic, :string

  end
end
