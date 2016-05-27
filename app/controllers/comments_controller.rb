class CommentsController < ApplicationController

  def new
   @comment = Comment.new
   @review_id = params[:review_id]
   if request.xhr?
     render partial: 'comments/new', locals: {comment: @comment}
   end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.json { render :json => {count: count} }
      end
      # redirect_to "/films/#{@comment.review.film.id}"
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

 private
    def comment_params
      params.require(:comment).permit(:body,:user_id, :review_id)
    end
end

