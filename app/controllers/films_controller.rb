class FilmsController < ApplicationController

  def index
    @films = Film.all
  end

  def show
    @film = Film.find(film_params)
  end



private

  def film_params
    params.require(:film).permit(:id)
  end
end
