class AddColumnToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :funding_to_date, :integer, default: 0
  end
end
