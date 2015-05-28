class ProspectsController < ApplicationController

  skip_before_action :store_path, only: [:create]

  def index
    @prospects_info = @prospects.details
  end

  def update
    @prospects.adjust(adjust_params)
    session[:prospects] = @prospects.contents
    redirect_to prospects_path
  end

  def create
    @prospects.add(prospect_params)
    session[:prospects] = @prospects.contents
    happy_forwarding("Prospect has been added.")
  end

  private

  def prospect_params
    params.require(:prospect).permit(:business_id, :amount)
  end

  def adjust_params
    params.permit(:id, :change)
  end

end
