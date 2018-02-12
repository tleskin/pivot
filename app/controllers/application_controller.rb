class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?, :prospects?, 
                :regional_admin?, :platform_admin?, :load_prospects
  
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  before_action :load_portfolio
  before_action :load_prospects



  include SessionsHelper

  def platform_admin?
    @current_user && current_user.platform_admin?
  end

  def regional_admin?
    @current_user && current_user.regional_admin?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def load_portfolio
    @portfolio ||= Portfolio.new(session[:portfolio])
  end

  def load_prospects
    @prospects ||= Prospects.new(session[:prospects])
  end

  def logged_in?
    session[:user_id]
  end

  def prospects?
    @prospects.contents != {}
  end

  def prospects
    load_prospects
  end

end
