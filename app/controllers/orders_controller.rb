class OrdersController < ApplicationController


  def index

  end

  def show

  end

  def create
    if current_user.nil?
      redirect_to login_path
    else
      OrderCreator.generate(@cart, current_user)
      session[:cart] = nil
      redirect_to root_path
    end
    # redirect to confirmation page
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
