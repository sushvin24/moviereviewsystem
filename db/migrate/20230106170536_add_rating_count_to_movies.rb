class AddRatingCountToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :ratings_count, :integer, :default => 0
    change_column :movies, :average_rating, :integer, :default => 0
    change_column :movies, :reviews_count, :integer, :default => 0
  end
end
