class OrdersController < ApplicationController


  def index

  end

  def show

  end

  def create
    p "PARAMS================> #{params}"
    # @cart.save
    order_id = params[:id]
    OrderCreator.generate(@cart, current_user)
    session[:cart] = nil
    redirect_to root_path
    # redirect to confirmation page
  end

  def update
  end

end
