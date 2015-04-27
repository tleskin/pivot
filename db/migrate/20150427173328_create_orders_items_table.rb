class CreateOrdersItemsTable < ActiveRecord::Migration
  def change
    create_join_table :orders, :items do |t|
      t.index :order_id
      t.index :item_id
    end
  end
end
