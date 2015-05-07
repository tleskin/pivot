class UnauthSessionsController < ApplicationController

  def show
    flash[:errors] = ""
    @items = Item.active_items
    @categories = Category.all
  end

end
