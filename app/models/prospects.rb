require 'ostruct'

class Prospects

  attr_accessor :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add(prospect_data)
    @contents[prospect_data['business_id']] ||= 0
    @contents[prospect_data['business_id']] += prospect_data['amount'].to_i 
  end

  def adjust(prospect_data)
    @contents[prospect_data[:id]]   = 0   if prospect_data[:change] == 'remove'
    @contents[prospect_data[:id]]  += 100 if prospect_data[:change] == 'add'
    @contents[prospect_data[:id]]  -= 100 if prospect_data[:change] == 'subtract'
    sanitize
  end

  def details
    prospects = []
    contents.each do |business_id, amount|
      prospects << prospect_info(business_id, amount)
    end
    prospects
  end

  def prospect_info(business_id, amount)
    business = Business.find(business_id.to_i)
    OpenStruct.new(business: business, amount: amount.to_d)
  end

  private

  def sanitize
    @contents.reject! { |business_id, amount| amount <= 0 }
  end

end