class CommentsController < ApplicationController

  def new
   @comment = Comment.new
   @review_id = params[:review_id]
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/films/#{@comment.review.film.id}"
    else
      render 'new'
    end
  end

  def delete
    comment = Comment.find_by(id: params[:id])
    film_id = comment.review.film.id
    comment.destroy
    redirect_to "/films/#{film_id}"
  end
    def same_user?(user)
      logged_in? && current_user == user
    end
 private
    def comment_params
      params.require(:comment).permit(:body,:user_id, :review_id)
    end
end

