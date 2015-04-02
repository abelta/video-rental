class RenameBoughtMovies < ActiveRecord::Migration

  def change
    rename_table :bougt_movies, :bought_movies
  end

end
