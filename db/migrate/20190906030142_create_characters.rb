class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :character_name
      t.text :character_description
      t.text :appearance
      t.string :role
      t.integer :anime_id
      t.timestamps
    end
    add_index :characters, :anime_id
  end
end
