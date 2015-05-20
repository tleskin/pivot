class StaticPagesController < ApplicationController

  def home
    @regions = Region.all
  end

  def about
  end

  def contact
  end

end