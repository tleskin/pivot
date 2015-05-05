class PurchasesController < ApplicationController

  def create
    item = Item.find(params[:format])
    flash[:notice] = "#{item.title}, I choose you!"
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to root_path
  end
end
