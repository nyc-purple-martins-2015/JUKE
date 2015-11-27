class Setlist < ActiveRecord::Base
  belongs_to :host, class_name: "User", foreign_key: :user_id
  has_many :setlist_songs
  has_many :songs, through: :setlist_songs
  has_many :guest_setlists
  has_many :guests, through: :guest_setlists, source: :user

  validates_presence_of :host, :name, :invite_code, :spotify_url

  def tracks_from_setlist(array_of_tracks_hash)
    tracks_not_loaded = []
    array_of_tracks_hash.each do |track_hash|
      song = Song.find_or_create_by(track_hash)
      setlist_song = setlist_songs.new(song: song, list_status: 2)
      tracks_not_loaded << setlist_song.title unless setlist_song.save
    end
  end

  def spotify_id
    spotify_url.split("/").last
  end

  def sort_by_votecount(list_status = nil)
    s_songs(list_status).sort_by { |setlist_song| -1 * setlist_song.count_vote_total }
  end

  private

  def s_songs(list_status)
    if list_status
      setlist_songs.where(list_status: list_status)
    else
      setlist_songs
    end
  end
end
