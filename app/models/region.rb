class Region < ActiveRecord::Base
  belongs_to :user
  has_many :businesses

  validates :name, :description, presence: true

  has_attached_file :image, default_url: "default_region_image.jpg"
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

end