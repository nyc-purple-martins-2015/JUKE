class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :setlist_song

  validates_presence_of :user, :setlist_song, :value

  def first_vote?(user, setlist_song)
    user.votes.count(setlist_song_id = setlist_song.id) == 0
  end

end
