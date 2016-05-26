class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @review = Review.where(user_id: @user.id, )
  end

  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
    if @user.save
      redirect_to categories_path
      session[:user_id] = @user.id
    else
      render 'new'
    end
  end

 private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end
