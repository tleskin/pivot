class Order < ActiveRecord::Base
  has_many   :orders_items
  has_many   :purchases
  has_many   :items, through: :orders_items
  belongs_to :user
  validates  :status, presence: true, inclusion: { in: %w(ordered completed cancelled paid) }
  validates  :user_id, presence: true
end
