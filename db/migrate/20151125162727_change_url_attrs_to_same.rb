class ChangeUrlAttrsToSame < ActiveRecord::Migration
  def change
    rename_column :setlists, :list_spotify_url, :spotify_url
    rename_column :songs, :song_spotify_url, :spotify_url
  end
end
