class EditAverageRatingInMovies < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :average_rating, :float, :default => 0, :precision => 15, :scale => 1
  end
end
