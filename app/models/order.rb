class Order < ActiveRecord::Base
  belongs_to :user
  validates :status, presence: true, inclusion: { in: %w(ordered completed cancelled) }

end
