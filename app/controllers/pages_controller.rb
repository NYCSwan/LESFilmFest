class PagesController < ApplicationController

  def winners
    @categories = Category.all
  end

end
