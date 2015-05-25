module SessionsHelper

  def redirect_back_or(default)
    redirect_to(session[:forward] || default)
    session.delete(:forward)
  end

  def store_location
    session[:forward] = request.url if request.get?
  end

end