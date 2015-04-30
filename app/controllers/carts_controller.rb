class CartsController < ApplicationController

  def show
    @items = []
    @quantities = []
    @cart.contents.each do |item_id, quantity|
      @items << Item.find(item_id)
      @quantities << quantity
    end
    @order = 1
    @order = Order.last.id + 1 if Order.last
  end

end
