class StaticPagesController < ApplicationController

  def home
    @businesses = Business.promoted
  end

  def about
  end

  def contact
  end

end