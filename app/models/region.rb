class Region < ActiveRecord::Base
  has_many :users
  has_many :businesses

  validates :name, :description, presence: true

  has_attached_file :image, default_url: "default_region_image.jpg"
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  def business_count
    businesses.count
  end 

  def email
  end

end
