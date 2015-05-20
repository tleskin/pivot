class Business < ActiveRecord::Base
  belongs_to :region
  has_many :investments
  has_many :business_categories
  has_many :categories, through: :business_categories
  
  validates :name, presence: true
  validates :description, presence: true
  validates :funding_needed, presence: true, numericality: { greater_than: 0 }

  has_attached_file :image, default_url: "default_business_image.jpg"
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]


  # def self.active_items
  #   Item.where(retired: false)
  # end

  # def dec_price
  #    price/100
  # end

  # def average_score
  #   scores = reviews.map(&:score)
  #   scores.reduce(:+)/scores.length
  # end

end
