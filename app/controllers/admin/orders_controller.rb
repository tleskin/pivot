class Admin::OrdersController < Admin::BaseController

  def show
    @order = Order.find(params[:id])
  end

  def index
    @completed_orders = Order.where(status: "completed")
    @cancelled_orders = Order.where(status: "cancelled")
    @ordered_orders   = Order.where(status: "ordered")
    @paid_orders      = Order.where(status: "paid")
  end

  def paid
    @paid_orders = Order.where(status: "paid")
  end

  def cancelled
    @cancelled_orders = Order.where(status: "cancelled")
  end

  def ordered
    @ordered_orders = Order.where(status: "ordered")
  end

  def completed
    @completed_orders = Order.where(status: "completed")
  end

end
