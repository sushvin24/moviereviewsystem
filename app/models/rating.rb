class Rating < ApplicationRecord
  validates :rate, presence: true
  belongs_to :movie, counter_cache: true
  belongs_to :user

  after_create :avg_rate

  private
  def avg_rate
    rate = Rating.where(movie_id: movie.id).average(:rate)
    Movie.where(id: movie.id).update(:average_rating => rate)
  end
end
