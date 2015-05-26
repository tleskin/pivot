class User < ActiveRecord::Base
  belongs_to  :region
  has_many    :investments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true, uniqueness: true
  validates :password, presence: true
  validates_length_of :username, :maximum=>32, :minimum=>2

  has_secure_password

  enum role: ['default', 'regional-admin', 'platform-admin']

  def to_param
    email
  end

  def regional_admin?
    role == 'regional-admin'
  end

  def platform_admin?
    role == 'platform-admin'
  end

  def investments_detail
    investments.map do |investment|
      investment.details
    end
  end

end
