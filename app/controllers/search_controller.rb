class SearchController < ApplicationController

  def create
    @results  = NewSpotifySongCreator.new(params[:query], SpotifyGetter.new(...)).hash_of_hash_thing_wtf

    #json = spotify_get(search_url(@query, "track"))
    #parsed = JSON.parse(json.body)
    #track_items = parsed["tracks"]["items"]
    # I might urge you to consider inject() versus each here...
    #@results = track_items.each do |t|
      #artist_list = []
      #t["artists"].each { |artist| artist_list << artist["name"] }

       #{
        #title: t["name"],
        #artist: artist_list.join(", "),
        #album: t["album"]["name"],
        #url: t["href"],
        #id: t["id"]
       #}
    #end

    render partial: 'search/new', locals: {setlist_id: params[:setlist_id]}
  end

end

