class CategoriesController < ApplicationController

  def index
    flash[:errors] = nil
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items.where(retired: false)
  end
end
