class CommentsController < ApplicationController

  def new

  end

  def create
    Comment.create!(params.require(:comment).permit(:body, :user_id, :review_id))
    redirect_to "/films/#{Review.find_by(id: params[:comment][:review_id]).film.id}"
  end

end
