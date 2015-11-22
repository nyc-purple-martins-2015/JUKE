class SongsController < ApplicationController

  def create
    song = Song.new(song_params)
    if song.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

private

  def song_params
    params.require(:song).permit(:title, :artist, :album, :song_spotify_url, :id)
  end
end


