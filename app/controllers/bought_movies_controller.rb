class BoughtMoviesController < ApplicationController
  before_action :set_bought_movie, only: [:show, :edit, :update, :destroy]

  # GET /bought_movies
  # GET /bought_movies.json
  def index
    @bought_movies = current_user.bought_movies.all
  end

  # GET /bought_movies/1
  # GET /bought_movies/1.json
  def show
  end


  # DELETE /bought_movies/1
  # DELETE /bought_movies/1.json
  def destroy
    @bought_movie.destroy
    respond_to do |format|
      format.html { redirect_to bought_movies_url, notice: 'bought movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bought_movie
      @bought_movie = boughtMovie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bought_movie_params
      params.require(:bought_movie).permit(:id, :title, :poster_url)
    end
end
