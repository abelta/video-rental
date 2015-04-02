FactoryGirl.define do

  factory :bought_movie do

    movie_id { rand().truncate }
    title { Faker::Lorem.sentence }
    poster_url { Faker::Internet.url }

  end

end
