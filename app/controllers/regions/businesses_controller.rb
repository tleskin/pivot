class Regions::BusinessesController < Regions::BaseController

  def index
    region = Region.find(params[:region])
    @businesses = Business.where(region_id: region.id)
  end

  def show
    @business = Business.find(params[:id])
  end

end
