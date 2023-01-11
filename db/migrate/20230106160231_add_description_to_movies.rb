class AddDescriptionToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :description, :text
    change_column :reviews, :comment, :text
  end
end
