class SongsController < ApplicationController

  def create
    find_setlist = Setlist.find(params[:setlist_id])
    song = Song.find_or_create_by(song_params)
    setlist_songs = SetlistSong.all
    setlist_songs.each do |setlist_song|
      set_found_song = Song.find(setlist_song.song_id)
      if set_found_song.song_spotify_url == song.song_spotify_url
        new_vote = Vote.create(user_id: current_user.id, setlist_song_id: setlist_song.id, value: 1)
      else
        SetlistSong.create(setlist_id: params[:setlist_id], song_id: song.id, list_status: 0)
      end
    end
      redirect_to root_path
  end

private

  def song_params
    params.require(:song).permit(:title, :artist, :album, :song_spotify_url, :id)
  end
end


