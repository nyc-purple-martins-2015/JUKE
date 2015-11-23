class SongsController < ApplicationController

  def create
    setlist = Setlist.find_by(id: params[:setlist_id])
    song = Song.find_or_create_by(song_params)
    setlist_song = SetlistSong.find_by(song: song, setlist: setlist)
    if setlist_song
      Vote.create!(user: current_user, setlist_song: setlist_song, value: 1)
    else
      SetlistSong.create!(setlist: setlist, song: song, list_status: 0)
    end
    redirect_to setlist_path(id: params[:setlist_id])
  end

private

  def song_params
    params.require(:song).permit(:title, :artist, :album, :song_spotify_url)
  end
end


