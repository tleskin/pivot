class ChangeTableBusiness < ActiveRecord::Migration
  def change
    change_table(:businesses) do |t|
      t.column    :image_file_name, :string
      t.column    :image_content_type, :string
      t.column    :image_file_size, :integer
      t.column    :image_updated_at, :datetime
    end
  end
end
