class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:errors] = "Invalid login"
      redirect_to root_path
    end
  end

  def destroy
    session.destroy
    redirect_to home_path
    flash[:notice] = "Successfully logged out"
  end

  private

  def redirect_to_landing_page(user)
    if user.admin?
      redirect_to admin_path(user)
    else
      redirect_to user
    end
  end

end
