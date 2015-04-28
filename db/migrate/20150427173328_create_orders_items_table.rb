class CreateOrdersItemsTable < ActiveRecord::Migration
  def change
    create_table :orders_items do |t|
      t.references :order_id, index: true, foreign_key: true
      t.references :item_id, index: true, foreign_key: true
    end
  end
end
