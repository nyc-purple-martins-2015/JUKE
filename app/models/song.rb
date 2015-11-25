class Song < ActiveRecord::Base
  has_many :setlist_songs
  has_many :setlists, through: :setlist_songs

  validates_presence_of :title, :artist, :album, :spotify_url

  def spotify_id
    spotify_url.split("/").last
  end
end
