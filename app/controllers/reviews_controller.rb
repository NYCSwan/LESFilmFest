class ReviewsController < ApplicationController

  def new

  end

  def create
    Review.create!(params.require(:review).permit(:title, :body, :user_id, :film_id))
  end

end
