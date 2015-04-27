class AddDefaultValuesToItems < ActiveRecord::Migration
  def change
    change_column :items, :retired, :boolean, default: false
    change_column :items, :image, :string, default: "https://browshot.com/static/images/not-found.png"
  end
end
