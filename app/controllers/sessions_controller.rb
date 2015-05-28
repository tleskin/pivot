class SessionsController < ApplicationController

  skip_before_action :store_path

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      where_to_redirect_authenticated_user
    else
      redirect_to root_path, danger: "Invalid login"
    end
  end

  def destroy
    session.destroy
    redirect_to home_path, success: "Successfully logged out"
  end

  private

  def where_to_redirect_authenticated_user
    user = User.find(session[:user_id]) 
    if user.role == 'regional-admin'
      redirect_to regional_admin_region_path(id: user.region_id), success: "You are logged in as a regional manager."
    else
      happy_forwarding("You are logged in.")
    end
  end

end
