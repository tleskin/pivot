class RegionalAdmin::UsersController < RegionalAdmin::BaseController

  def index
    @admins = User.regional_managers(current_user.region_id)
  end

  def new
  end

  def edit
  end

  def update
  end

  def make_admin
    user = User.find_by(email: params[:email])
    if user
      user.update(role: 1, region_id: current_user.region_id)
      redirect_to regional_admin_users_path, success: "New admin added."
    else
      redirect_to regional_admin_users_path, danger: "Invalid user."
    end
  end

  def create
    user = User.new(admin_params)
    if user.save
      user.update(region_id: current_user.region_id, role: 1)
      redirect_to regional_admin_users_path, success: "New admin created."
    else
      redirect_to regional_admin_users_path, danger: "Invalid attributes, new admin not created."
    end
  end

  def destroy
    User.make_default(params[:id])
    redirect_to regional_admin_users_path
  end

  private

  def admin_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

end