class Admin::Regional::UsersController < Admin::Regional::BaseController

  def index
    @admins = User.regional_managers(current_user.region_id)
  end

  def new
  end

  def create
    user = User.new(admin_params)
    if user.save
      user.update(region_id: current_user.region_id, role: 1)
      redirect_to admin_regional_users_path
    else
      flash[:notice] = "Invalid attributes, new admin not created."
      redirect_to admin_regional_users_path
    end
  end

  def destroy
    User.make_default(params[:id])
    redirect_to admin_regional_users_path
  end

  private

  def admin_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

end