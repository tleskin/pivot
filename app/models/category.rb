class Category < ActiveRecord::Base
  has_many :business_categories
  has_many :businesses, through: :business_categories
  validates :name, presence: true
end
