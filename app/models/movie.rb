class Movie < ApplicationRecord
  validates :title, :description, :director, :release_date, presence: true
  has_many :ratings, :dependent => :destroy
  has_many :reviews, :dependent => :destroy

  scope :filter_by_date, ->(from_date, to_date) { where("release_date >= ? AND release_date <= ?", from_date, to_date) }
  scope :filter_by_title, ->(title) { where('title LIKE ?', "%#{title}%") }
end
