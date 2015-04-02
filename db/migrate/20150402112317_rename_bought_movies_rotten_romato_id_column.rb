class RenameBoughtMoviesRottenRomatoIdColumn < ActiveRecord::Migration

  def change
    rename_column :bought_movies, :rotten_tomatoes_id, :movie_id
  end

end
