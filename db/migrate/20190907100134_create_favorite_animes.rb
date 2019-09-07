class CreateFavoriteAnimes < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_animes do |t|
      t.integer :user_id
      t.integer :anime_id
      t.timestamps
    end
    add_index :favorite_animes, :user_id
    add_index :favorite_animes, :anime_id
  end
end
