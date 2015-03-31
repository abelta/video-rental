require 'rails_helper'

RSpec.describe Movie, :type => :model do
  
  context "validations" do

    it "has a valid factory" do
      expect( build :movie ).to be_valid
    end

    it "is not valid without a title" do
      movie = build :movie, title: nil
      movie.valid?
      expect( movie.errors[:title].size ).to be >= 1
    end

    it "is not valid without a synopsis" do
      movie = build :movie, synopsis: nil
      movie.valid?
      expect( movie.errors[:synopsis].size ).to be >= 1
    end

  end

end
