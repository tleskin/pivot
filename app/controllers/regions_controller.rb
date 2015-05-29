class RegionsController < ApplicationController
  helper_method :business_count

  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
  end

  def show
    @region = Region.find(params[:id])
  end

  def create
    region = Region.new(region_params)
    if region.save
      redirect_to region_path(region), success: "Region has been created."
    else
      redirect_to new_region_path, danger: region.errors.full_messages.join(", ")
    end
  end

  def business_count(region)
    region.businesses.count
  end

  private

  def region_params
    params.require(:region).permit(:name, :description, :image)
  end

end
