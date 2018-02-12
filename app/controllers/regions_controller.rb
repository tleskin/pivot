class RegionsController < ApplicationController
  helper_method :business_count

  def index
    @regions = Region.all
  end

  def show
    @region = Region.find(params[:id])\
  end

  def business_count(region)
    region.businesses.count
  end
end
