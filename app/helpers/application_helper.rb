module ApplicationHelper

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


