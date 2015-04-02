class CreateBougtMovies < ActiveRecord::Migration
  def change
    create_table :bougt_movies do |t|
      t.integer :user_id
      t.integer :rotten_tomatoes_id
      t.string :title
      t.string :poster_url

      t.timestamps null: false
    end
  end
end
