class SetlistSongsController < ApplicationController

  def update

    # params.each do |param|
    #   if

  end

  def setlist_songs_params
    params.require(:setlist_song).permit(:setlist_song_id)
  end

end
