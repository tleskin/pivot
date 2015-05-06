class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @reviews = Review.where(item_id: params[:id])
    @review = Review.new
  end

end
