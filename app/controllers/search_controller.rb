class SearchController < ApplicationController

  def create
    @query = params[:query]
    json = spotify_get(search_url(@query, "track"))
    parsed = JSON.parse(json.body)
    p parsed
    redirect_to root_path
  end

end

