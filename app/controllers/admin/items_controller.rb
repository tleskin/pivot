class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    categories = params[:item][:category_ids].reject(&:empty?)
    if @item.save
      categories.each { |cat| @item.categories << Category.find(cat) }
      redirect_to admin_items_path
    else
      flash[:notice] = "Invalid item creation"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def update
    @item = Item.find(params[:id])
    categories = params[:item][:category_ids].reject(&:empty?)
    if @item.update(item_params)
      categories.each { |cat| @item.categories << Category.find(cat) }
      redirect_to admin_items_path
    else
      flash[:notice] = "Invalid fields"
      render :edit
    end
  end

  def retire

  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :retired, :category_ids)
  end

end
