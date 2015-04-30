class OrdersController < ApplicationController


  def index

  end

  def show

  end

  def create
    puts "PARAMS+++=======>>>>>>#{params}"
    redirect_to root_path
  end
end
