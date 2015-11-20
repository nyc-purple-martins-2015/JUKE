class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :setlist_song

  validates_presence_of :user, :setlist_song, :value
end
