class UnauthSessionsController < ApplicationController

  def show
    @items = Item.all
    @categories = Category.all
  end

  def description
    # @item = Item.find(params[:id])
  end
end
