class Order < ActiveRecord::Base
  has_many   :orders_items
  has_many   :purchases
  has_many   :items, through: :purchases
  belongs_to :user
  validates  :status, presence: true, inclusion: { in: %w(ordered completed cancelled paid) }
  validates  :user_id, presence: true

  def total
    purchases = self.purchases
    subtotals = purchases.map do |purchase|
      purchase.quantity * Item.find(purchase.item_id).price
    end
    subtotals.reduce(:+)
  end

end
