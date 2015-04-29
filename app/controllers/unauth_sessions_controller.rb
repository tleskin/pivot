class UnauthSessionsController < ApplicationController

  def show
    @items = Item.active_items
    @categories = Category.all
  end

  def description
    # @item = Item.find(params[:id])
  end
end
