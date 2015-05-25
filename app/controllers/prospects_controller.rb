class ProspectsController < ApplicationController

  def index
    @prospects_info = @prospects.details
  end

  def tester
  end

  def update
    @prospects.adjust(adjust_params)
    session[:prospects] = @prospects.contents
    redirect_to prospects_path
  end

  def create
    @prospects.add(prospect_params)
    session[:prospects] = @prospects.contents
    redirect_to root_path
  end

  private

  def prospect_params
    params.require(:prospect).permit(:business_id, :amount)
  end

  def adjust_params
    params.permit(:id, :change)
  end

end
