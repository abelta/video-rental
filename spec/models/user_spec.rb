require 'rails_helper'

RSpec.describe User, :type => :model do

  context "validations" do
      
    it "has a valid factory" do
      expect( build(:user) ).to be_valid
    end

    it "is not valid without a name" do
      user = build :user, name: nil
      user.valid?
      expect( user.errors[:name].size ).to be >= 1
    end

    it "is not valid without a email" do
      user = build :user, email: nil
      user.valid?
      expect( user.errors[:email].size ).to be >= 1
    end

    it "is not valid without a password" do
      user = build :user, password: nil
      user.valid?
      expect( user.errors[:password].size ).to be >= 1
    end

    it "has a unique email" do
      create :user, email: "example1@gmail.com"
      user = build :user, email: "example1@gmail.com"
      user.valid?
      expect( user.errors[:email].size ).to be >= 1
    end

  end


  context "buy_movie" do

    it "add a new movie to the user's bought movies" do
      user = create :user
      movie = build :bought_movie
      expect {
        user.buy_movie attributes_for(:bought_movie)
      }.to change{ user.bought_movies.count }.by 1
    end

  end
  
end
