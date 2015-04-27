class User < ActiveRecord::Base
  has_many  :orders
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates_length_of :username, :maximum=>32, :minimum => 2
  has_secure_password
end
