class RegionalAdmin::BusinessesController < RegionalAdmin::BaseController

  def index
    @businesses = Business.where(region_id: current_user.region_id)
  end

  def show
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    business = Business.find(params[:id])
    formatted_params = format_params(business_params)
    if business.update(formatted_params)
      redirect_to regional_admin_region_path, success: "Business updated."
    else
      redirect_to regional_admin_region_path, danger: business.errors.full_messages.join(", ")
    end
  end

  def create
  end

  def destroy
    business = Business.where(region_id: current_user.region_id).find(params[:id])
    if business.destroy
      redirect_to regional_admin_businesses_path, success: "Business has been deleted."
    else
      messages = business.errors.full_messages.join(', ')
      redirect_to regional_admin_businesses_path, danger: messages
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :description, :funding_needed, :funding_to_date, :image)
  end

end
