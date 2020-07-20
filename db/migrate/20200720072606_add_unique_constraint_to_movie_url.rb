class AddUniqueConstraintToMovieUrl < ActiveRecord::Migration[6.0]
  def change
    add_index :movies, :url, unique: true
  end
end
