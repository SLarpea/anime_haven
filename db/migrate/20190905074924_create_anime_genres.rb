class CreateAnimeGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :anime_genres do |t|
      t.integer :anime_id
      t.integer :genre_id
      t.timestamps
    end
    add_index :anime_genres, :anime_id
    add_index :anime_genres, :genre_id
  end
end
