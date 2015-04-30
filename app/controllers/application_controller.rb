class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :load_cart

  def admin?
    @current_user && @current_user.admin?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
      current_user && current_user.admin?
  end

  def load_cart
    @cart ||= Cart.new(session[:cart])
  end
end
