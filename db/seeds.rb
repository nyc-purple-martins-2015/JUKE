user = User.create!(username: "Jon", password: "password", email: "jon@example.com")
user2 = User.create!(username: "Law", password: "password", email: "law@example.com")
user3 = User.create!(username: "Cory", password: "password", email: "cory@example.com")

setlist = Setlist.create!(name: "my_list", host: user, list_spotify_url: "url.com", invite_code: "12345")
GuestSetlist.create!(guest: user2, setlist: setlist)

song = Song.create!(title: "song title", artist: "artist", album: "song album", song_spotify_url: "song_url")

setlist_song = SetlistSong.create!(song: song, setlist: setlist)

Vote.create!(user: user2, setlist_song: setlist_song, value: 1)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
