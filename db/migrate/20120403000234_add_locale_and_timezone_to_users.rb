class AddLocaleAndTimezoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locale, :string

    add_column :users, :timezone, :string

  end
end
