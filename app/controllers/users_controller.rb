class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
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