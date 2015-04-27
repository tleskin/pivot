class Item < ActiveRecord::Base
  has_many  :categories_items
  has_many  :categories, through: :categories_items
  has_many  :orders_items
  has_many  :orders, through: :orders_items
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true
  validates :retired, inclusion: { in: [true, false] }
end
