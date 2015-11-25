class Setlist < ActiveRecord::Base
  belongs_to :host, class_name: "User", foreign_key: :user_id
  has_many :setlist_songs
  has_many :songs, through: :setlist_songs
  has_many :guest_setlists
  has_many :guests, through: :guest_setlists, source: :user

  validates_presence_of :host, :name, :invite_code, :list_spotify_url

  def spotify_id
    list_spotify_url.split("/").last
  end

  def sort_by_votecount(list_status = nil)
    if list_status
      vote_count_sort(setlist_songs.where(list_status: list_status))
    else
      vote_count_sort(setlist_songs)
    end
  end

  private

  def vote_count_sort(s_songs)
    s_songs.sort_by { |setlist_song| -1 * setlist_song.count_vote_total }
  end
end
