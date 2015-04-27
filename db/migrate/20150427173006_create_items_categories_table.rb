class CreateItemsCategoriesTable < ActiveRecord::Migration
  def change
    create_join_table :items, :categories do |t|
      t.index :item_id
      t.index :category_id
    end
  end
end
