class SetlistSong < ActiveRecord::Base
  belongs_to :song
  belongs_to :setlist
  has_many :votes

  validates_presence_of :song, :setlist
end
