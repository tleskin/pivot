class AddReferencesToUsers < ActiveRecord::Migration
  def change
    remove_column :regions, :user_id
  end
end
