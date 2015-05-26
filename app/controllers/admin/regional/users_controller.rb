class Admin::Regional::UsersController < Admin::Regional::BaseController

  def index
    @admins = User.regional_managers(current_user.id)
  end

  def new
    binding.pry
    @user = User.new
  end

  def create
    # @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      puts "HERE***************************"
      flash[:notice] = "Invalid fields"
      redirect_to root_path
    end
  end

  def destroy
    User.make_default(params[:id])
    redirect_to admin_regional_admins_path
  end

  private

  def admin_params

  end

end