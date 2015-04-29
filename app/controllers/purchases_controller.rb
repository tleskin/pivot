class PurchasesController < ApplicationController

  def create
    item = Item.find(params[:id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
  end

end
