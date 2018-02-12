class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserNotifier.send_signup_email(@user).deliver_now
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Invalid fields"
      render :new
    end
  end

  def show
  end

  def cart
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by(email: params[:user][:email])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:notice] = "Invalid fields"
      render :edit
    end
  end

  private

  def logged_in_user
    unless logged_in?
      redirect_to login_path
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

end
