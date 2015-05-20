class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :description
      t.integer :funding_needed
      t.references :region, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
