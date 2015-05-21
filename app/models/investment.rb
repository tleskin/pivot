require 'ostruct'

class Investment < ActiveRecord::Base
  belongs_to :business
  belongs_to :user

  def details
    OpenStruct.new(business_name: Business.find(self.business_id).name,
                   amount: self.amount)
  end
end
