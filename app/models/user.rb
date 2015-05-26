class User < ActiveRecord::Base
  belongs_to  :region
  has_many    :investments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true, uniqueness: true
  validates :password, presence: true,
                       :confirmation => true,
                       :length => { :within => 6..40 },
                       :unless => :already_has_password?
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

  def self.regional_managers(region_id)
    where(region_id: region_id).where(role: 1)
  end

  def self.make_default(id)
    find(id).update(region_id: nil, role: 0)
  end

  private

  def already_has_password?
    !self.password_digest.blank?
  end

end
