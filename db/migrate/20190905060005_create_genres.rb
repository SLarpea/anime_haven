class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :genre_name
      t.text :content
      t.timestamps
    end
  end
end
