class InvestmentsController < ApplicationController

  def index
    @investments = current_user.investments_detail
  end

  def show
    @investment = current_user.investments.find(params[:id])
  end

  def show
    @investment = current_user.investments.find_by(params[:id])
  end

  def create
    Investment.generate(@prospects, current_user.id)
    @investments = current_user.last_investment_group_details
    session[:prospects] = {}
    UserNotifier.send_investment_email(current_user, @investments).deliver_now
    send_investment_emails(@investments)
    redirect_to root_path, success: "Check your email for investment confirmation."
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
