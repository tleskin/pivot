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

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to item_path(@review.item)
  end

  def destroy
    @review = Review.find(params[:id])
    item = @review.item
    @review.destroy
    redirect_to item_path(item)
  end

  private

  def review_params
    params.require(:review).permit(:title, :review, :score, :item_id, :user_id)
  end
end
