module ApplicationHelper

  def turn_money_to_pennies(value)
    value.scan(/\d/).join('').to_i
  end

  def happy_forwarding(message = nil)
    if session[:forward]
      redirect_to({controller: session[:forward]['controller'], 
                  action:      session[:forward]['action'], 
                  region:      session[:forward]['region'], 
                  id:          session[:forward]['id']}, 
                  success:     message)
    else
      redirect_to root_path
    end
  end

end


