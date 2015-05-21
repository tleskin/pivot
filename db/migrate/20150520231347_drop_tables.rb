class DropTables < ActiveRecord::Migration
  def change
    drop_table :items_categories
    drop_table :purchases
    drop_table :items
    drop_table :orders
    drop_table :reviews
  end
end
