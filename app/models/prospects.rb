require 'ostruct'

class Prospects

  attr_accessor :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def count_them
    @contents.keys.size
  end

  def add(prospect_data)
    @contents[prospect_data['business_id']] ||= 0
    @contents[prospect_data['business_id']] += prospect_data['amount'].to_i 
  end

  def adjust(prospect_data)
    if prospect_data[:change] == 'remove' 
      @contents[prospect_data[:id]] = 0
    else  
      @contents[prospect_data[:id]] = prospect_data[:change].to_i
    end
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
    OpenStruct.new(business: business, amount: monetize(amount))
  end

  private

  def sanitize
    @contents.reject! { |business_id, amount| amount <= 0 }
  end

  def monetize(pennies = 0)
      formatted = []
      pennies = pennies.to_s.rjust(3,'0') 
      pennies.split('').reverse.each.with_index do |value, index|
          if index == 1
              appended = ".#{value}"
          elsif index == pennies.length-1
              appended = "$#{value}"
          elsif index%3 == 1 
              appended = ",#{value}"
          else
              appended = value
          end
          formatted << appended
      end
      formatted.reverse.join
  end

end