class RegionalAdmin::RegionController < RegionalAdmin::BaseController

  def show
    @region = Region.find(current_user.region_id)
  end

  def edit
    @region = Region.find(current_user.region_id)
  end

  def update
  end

  private

  def region_params
    
  end

end