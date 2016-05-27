class ReviewsController < ApplicationController

  def new
     @review = Review.new
     @film_id = params[:film_id]
     if request.xhr?
      render partial: 'reviews/new', locals: {user: @user, review: @review}
     end
  end

  def create
     @review = Review.new(review_params)
    if @review.save
      redirect_to "/films/#{@review.film.id}"
    else
      render 'new'
    end
  end

 private
    def review_params
      params.require(:review).permit(:title, :body, :star_value, :user_id, :film_id)
    end
end
