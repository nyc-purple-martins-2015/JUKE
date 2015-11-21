class SetlistsController < ApplicationController

  def index

  end

  def edit
    @setlist= Setlist.find(params[:id])
    playlists = spotify_get("https://api.spotify.com/v1/users/#{current_user.uid}/playlists")
    json_playlists = JSON.parse(playlists.body)

    our_pretend_playlist = json_playlists["items"][3]
    our_pretend_playlist_url = our_pretend_playlist["href"]
    json_opp = spotify_get(our_pretend_playlist_url)
    parsed = JSON.parse(json_opp.body)
    t_array = parsed["tracks"]["items"]

    @tracks = t_array.map { |t| t["track"]["name"] }
  end




end
