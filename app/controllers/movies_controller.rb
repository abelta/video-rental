class MoviesController < ApplicationController

  def index
  end


  def buy
    @bought_movie = current_user.buy_movie movie_params
    respond_to do |format|
      if @bought_movie
        format.json { render json: {}, status: :created }
      else
        format.json { render json: {}, status: :unprocessable_entity }
      end
    end
  end
  

  private


  # Never trust parameters from the scary internet, only allow the white list through.
  def movie_params
    params.require(:movie).permit(:movie_id, :title, :poster_url)
  end

end
