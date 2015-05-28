require 'ostruct'

class Investment < ActiveRecord::Base
  belongs_to :business
  belongs_to :user

  include MoneyHelper

  def details
    OpenStruct.new(business_name: Business.find(self.business_id).name,
                   amount: monetize(self.amount),
                   date: self.updated_at.strftime('%v'))
  end

  def self.generate(prospects, user_id)
    prospects.contents.each do |business_id, amount|
      Investment.create!(business_id: business_id, user_id: user_id, amount: amount)
      Business.find(business_id).add_to_funding
    end
  end


end
