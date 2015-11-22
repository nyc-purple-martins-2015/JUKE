class SearchController < ApplicationController

  def create
    @query = params[:query]

    json = spotify_get(search_url(@query, "track"))
    parsed = JSON.parse(json.body)
    t_array = parsed["tracks"]["items"]
    @results = t_array.map do |t|
      artist_list = []
      t["artists"].each { |artist| artist_list << artist["name"] }

       {
        title: t["name"],
        artist: artist_list.join(", "),
        album: t["album"]["name"],
        url: t["href"],
        id: t["id"]
       }
    end

    render partial: 'search/new'
  end

end

