class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :business, index: true, foreign_key: true
      t.integer :amount
    end
  end
end
