class AddQuantityToOrdersItems < ActiveRecord::Migration
  def change
    add_column :orders_items, :quantity, :integer
  end
end
