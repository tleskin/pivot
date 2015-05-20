class PortfolioController < ApplicationController

  def show
    @items = []
    @quantities = []
    # @cart.contents.each do |item_id, quantity|
    #   @items << Item.find(item_id)
    #   @quantities << quantity
    # end
    @order = Order.last.id if Order.last
    @order ||= 1
  end

  def add_item
    @cart.add_item(params[:item_id])
    redirect_to cart_path(@cart)
  end

  def subtract_item
    @cart.subtract_item(params[:item_id])
    redirect_to cart_path(@cart)
  end

  def remove_item
     @cart.remove_item(params[:item_id])
     redirect_to cart_path(@cart)
   end

end
