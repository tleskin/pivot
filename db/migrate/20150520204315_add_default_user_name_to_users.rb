class AddDefaultUserNameToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :username 
    add_column :users, :username, :string, default: 'lender'
  end
end
