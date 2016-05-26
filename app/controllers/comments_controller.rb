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

 private
    def comment_params
      params.require(:comment).permit(:body,:user_id, :review_id)
    end
end

