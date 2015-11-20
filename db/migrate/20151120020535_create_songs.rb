class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.string :artist, null: false
      t.string :album, null: false
      t.string :song_spotify_url, null: false

      t.timestamps null: false
    end
  end
end
