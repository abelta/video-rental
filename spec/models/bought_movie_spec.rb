require 'rails_helper'

RSpec.describe BoughtMovie, :type => :model do
  

  it "has a valid factory" do
    expect( build(:bought_movie) ).to be_valid
  end


  context "validations" do

    it "is not valid without a title" do
      bought_movie = build :bought_movie, title: nil
      bought_movie.valid?
      expect(bought_movie.errors[:title].size).to be >= 1
    end

    it "is not valid without a movie_id" do
      bought_movie = build :bought_movie, movie_id: nil
      bought_movie.valid?
      expect(bought_movie.errors[:movie_id].size).to be >= 1
    end

  end

end
