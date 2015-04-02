class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  has_many :bought_movies



  def buy_movie (movie_params)
    self.bought_movies.create! movie_params
  end

end
