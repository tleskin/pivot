class Admin::OrdersController < Admin::BaseController

  def show
    @order = Order.find(params[:id])
  end

  def index
    @completed_orders = Order.where(status: "completed").order('id ASC')
    @cancelled_orders = Order.where(status: "cancelled").order('id ASC')
    @ordered_orders   = Order.where(status: "ordered").order('id ASC')
    @paid_orders      = Order.where(status: "paid").order('id ASC')
  end

  def paid
    @paid_orders = Order.where(status: "paid").order('id ASC')
  end

  def cancelled
    @cancelled_orders = Order.where(status: "cancelled").order('id ASC')
  end

  def ordered
    @ordered_orders = Order.where(status: "ordered").order('id ASC')
  end

  def completed
    @completed_orders = Order.where(status: "completed").order('id ASC')
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
