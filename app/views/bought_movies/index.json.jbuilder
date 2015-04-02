json.array!(@bought_movies) do |bought_movie|
  json.extract! bought_movie, :id, :movie_id, :title, :poster_url
end
