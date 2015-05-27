class RegionalAdmin::RegionBusinessesController < RegionalAdmin::BaseController

  def index
    @businesses = Business.where(region_id: current_user.region_id)
  end

  def show
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
    business = Business.where(region_id: current_user.region_id).find(params[:id])
    if business.destroy
      redirect_to regional_admin_region_businesses_path, success: "Business has been deleted."
    else
      messages = business.errors.full_messages.join(', ')
      redirect_to regional_admin_region_businesses_path, danger: messages
    end
  end

  private

  def business_params

  end

end