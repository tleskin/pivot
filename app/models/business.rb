class Business < ActiveRecord::Base
  belongs_to :region
  has_many :investments, dependent: :destroy
  has_many :business_categories, dependent: :destroy
  has_many :categories, through: :business_categories

  validates :name, presence: true
  validates :description, presence: true
  validates :funding_needed, presence: true, numericality: { greater_than: 0 }

  has_attached_file :image, default_url: "default_business_image.jpg"
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  def add_to_funding
    funding_to_date = investments.reduce(0) do |sum, investment|
      sum += investment.amount
    end
    self.update(funding_to_date: funding_to_date)
  end

  def self.promoted
    Business.all.sample(6)
  end

end
