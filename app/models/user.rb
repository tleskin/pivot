class User < ActiveRecord::Base
  before_save :create_username
  has_many  :orders
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, email: true
  validates_length_of :username, :maximum=>32, :minimum=>2
  has_secure_password
  has_many  :reviews

  def admin?
    role == 1
  end

  def create_username
    if self.username.nil? || self.username.blank?
      self.username = self.email
    end
  end
end
