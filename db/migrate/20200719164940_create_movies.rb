class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :description
      t.string :embed_code, null: false
      t.string :url, null: false
      t.timestamps
    end

    add_foreign_key :movies, :users, column: :user_id
  end
end
