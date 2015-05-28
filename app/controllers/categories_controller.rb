class CategoriesController < ApplicationController

  def index
    flash[:errors] = nil
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @businesses = @category.businesses
  end
end
