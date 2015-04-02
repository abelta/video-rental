class BoughtMovie < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :movie_id, presence: true
  
end
