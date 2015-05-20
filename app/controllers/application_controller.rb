class ApplicationController < ActionController::Base
  helper_method :current_user, :cart
  protect_from_forgery with: :exception
  before_action :load_portfolio

  def admin?
    @current_user && @current_user.admin?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def load_portfolio
    @portfolio ||= Portfolio.new(session[:portfolio])
  end

  def cart
    load_cart
  end
end
