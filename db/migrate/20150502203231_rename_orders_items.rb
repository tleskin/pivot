class RenameOrdersItems < ActiveRecord::Migration
  def self.up
    rename_table :orders_items, :purchases
  end
  def self.down
    rename_table :purchases, :orders_items 
  end
end
