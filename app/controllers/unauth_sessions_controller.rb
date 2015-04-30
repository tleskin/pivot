class UnauthSessionsController < ApplicationController

  def show
    @items = Item.active_items
    @categories = Category.all
  end

end
