class SearchController < ApplicationController

  def create
    @query = params[:query]

    json = spotify_get(search_url(@query, "track"))
    parsed = JSON.parse(json.body)
    t_array = parsed["tracks"]["items"]
    @results = t_array.map do |t|
      t["name"]
    end
    render partial: 'search/new'
  end

end

