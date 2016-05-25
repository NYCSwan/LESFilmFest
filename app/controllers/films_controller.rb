class FilmsController < ApplicationController

  def index
    @films = Film.all
  end

  def show
    @film = Film.find_by(id: params[:id])

    # @category = Category.find(params[:category_id])
  end



# private

#   def film_params
#     params.require(:film).permit(:id)
#   end
end
