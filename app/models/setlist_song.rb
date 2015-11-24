class SetlistSong < ActiveRecord::Base
  belongs_to :song
  belongs_to :setlist
  has_many :votes

  validates_presence_of :song, :setlist

  def vote_count
    self.votes.sum(:value)
  end

  def get_position_in_playlist(playlist_json)
    track_item_array = playlist_json["tracks"]["items"]
    track_item_array.index{ |track_item| track_item["track"]["href"] == song.song_spotify_url }
  end
end
