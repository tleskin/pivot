class AdjustColumnFuncindInBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :funding_needed
    add_column :businesses, :funding_needed, :integer, default: 0
  end
end
