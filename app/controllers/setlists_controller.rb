class SetlistsController < ApplicationController

  def index

  end

  def edit
    @setlist = Setlist.find(params[:id])
    @setlist_songs = @setlist.setlist_songs.where(list_status: 0)
    @tracks = get_setlist_tracks(@setlist)
  end




end
