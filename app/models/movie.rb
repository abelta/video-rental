class Movie < ActiveRecord::Base

  validates :title, presence: true
  validates :synopsis, presence: true

end
