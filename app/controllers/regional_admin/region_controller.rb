class RegionalAdmin::RegionController < RegionalAdmin::BaseController

  def show
    @region = Region.find(current_user.region_id)
  end

  def edit
    @region = Region.find(current_user.region_id)
  end

  def update
    region = Region.find(current_user.region_id)
    if region.update(region_params)
      redirect_to regional_admin_region_path(region), success: "Region data successfully updated"
    else
      redirect_to edit_regional_admin_region_path(region), danger: region.errors.full_messages.join(', ')
    end
  end

  private

  def region_params
    params.require(:region).permit(:image, :name, :description)
  end

end