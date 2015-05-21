class CreateBusinessCategories < ActiveRecord::Migration
  def change
    create_table :business_categories do |t|
      t.references :business, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
    end
  end
end
