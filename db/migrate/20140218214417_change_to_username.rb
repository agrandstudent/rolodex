class ChangeToUsername < ActiveRecord::Migration
  def change
    change_column  :users, :name, :string, :null => false
    add_index :users, :name, :unique => true
    rename_column :users, :name, :username
  end
end
