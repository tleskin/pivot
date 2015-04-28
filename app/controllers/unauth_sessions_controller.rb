class UnauthSessionsController < ApplicationController

  def show
    @items = Item.all
    @categories = Category.all
  end
end
