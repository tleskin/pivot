class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?, :prospects?, 
                :regional_admin?, :platform_admin?, :load_prospects
  
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  before_action :load_prospects
  before_action :store_path

  include ApplicationHelper

  def current_user
    @current_user ||= logged_in_user
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

  def store_path
    session[:forward] = {controller:  params[:controller], 
                         action:      params[:action],
                         region:      params[:region],
                         id:          params[:id]}
  end

  private

  def logged_in_user
    if session[:user_id]
      return User.find(session[:user_id])
    else
      return Guest.new      
    end
  end

end
