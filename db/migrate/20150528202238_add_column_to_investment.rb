class AddColumnToInvestment < ActiveRecord::Migration
  def change
    add_column(:investments, :created_at, :datetime)
    add_column(:investments, :updated_at, :datetime)
  end
end
