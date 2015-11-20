class Setlist < ActiveRecord::Base
  belongs_to :host, class_name: "User", foreign_key: :user_id
  has_many :setlist_songs
  has_many :songs, through: :setlist_songs
  has_many :guest_setlist
  has_many :guests, through: :guest_setlists, source: :user

  validates_presence_of :host, :name, :invite_code, :list_spotify_url
end
