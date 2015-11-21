class SetlistsController < ApplicationController

  def index

  end

  def edit
    @setlist= Setlist.find(params[:id])
    json = spotify_get(@setlist.list_spotify_url)
    parsed = JSON.parse(json.body)
    t_array = parsed["tracks"]["items"]

    @tracks = t_array.map do |t|

      artist_list = []
      t["track"]["artists"].each { |artist| artist_list << artist["name"] }

      {
        name: t["track"]["name"],
        song_spotify_url: t["track"]["href"],
        album: t["track"]["album"]["name"],
        artist: artist_list.join(", ")
      }
    end
  end




end
