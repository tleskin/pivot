class Item < ActiveRecord::Base
  has_many  :reviews
  has_many  :purchases
  has_many  :items_categories
  has_many  :categories, through: :items_categories
  has_many  :orders_items
  has_many  :orders, through: :purchases
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true
  validates :retired, inclusion: { in: [true, false] }
  validates_uniqueness_of :title

  def self.active_items
    Item.where(retired: false)
  end

  def average_score
    scores = reviews.map(&:score)
    scores.reduce(:+)/scores.length
  end

end
