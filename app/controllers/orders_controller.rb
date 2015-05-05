class OrdersController < ApplicationController


  def index

  end

  def show

  end

  def create
    OrderCreator.generate(@cart, current_user)
    session[:cart] = nil
    redirect_to root_path
    # redirect to confirmation page
  end

end
