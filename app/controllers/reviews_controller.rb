class ReviewsController < ApplicationController

  def create
    @review = Review.create(review_params)
    @review.score = params[:score]
    item = Item.find(params[:review][:item_id])
    if @review.save
      redirect_to item_path(item)
    else
      redirect_to root_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:review, :score, :item_id, :user_id)
  end
end
