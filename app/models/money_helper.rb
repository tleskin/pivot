module MoneyHelper

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