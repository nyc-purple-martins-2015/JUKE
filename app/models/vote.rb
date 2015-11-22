class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :setlist_song

  validate :first_vote?
  validates_presence_of :user, :setlist_song, :value

  def first_vote?
    errors.add(:first_vote, "you have already voted") if Vote.find_by(setlist_song: self.setlist_song, user: self.user)
  end
end
