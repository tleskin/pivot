class HomeController < ApplicationController

  def index
  end

  def not_found
    # flash[:error] = "Page not found"
    redirect_to root_path, danger: "Page not found"
  end
end
