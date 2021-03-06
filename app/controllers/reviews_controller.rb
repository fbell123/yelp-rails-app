class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create

    if current_user.nil?
      redirect_to '/yelp/index'
    elsif condition

    else
      @restaurant = Restaurant.find(params[:restaurant_id ])
      @review = @restaurant.reviews.create(review_params)
      @review.user_id = current_user.id
      @review.save
      redirect_to @restaurant
    end
  end

    def destroy
      @restaurant = Restaurant.find(params[:id])
      @review = @restaurant.reviews.find(params[:id])
      @review.destroy
    end

private
def review_params
  params.require(:review).permit(:comment, :rating)
end

end
