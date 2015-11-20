class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :setlist_song

end
