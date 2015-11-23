class SearchController < ApplicationController

  def create
    @query = params[:query]
    json = SpotifySearcher.new(session[:token], @query).get
    @results = SpotifySearcher.parse_search_results(json)
    render partial: 'search/new', locals: {setlist_id: params[:setlist_id]}
  end
end

