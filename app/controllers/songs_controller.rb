class SongsController < ApplicationController

  def create
=begin
    This action is a little odd. It looks like you are are trying to create
    a song if it doesn't exist, otherwise create a vote on it. That's 
    unexpected in a "resty" controller setup. You might be better off
    changing to front end to select the appropriate action if possible.

    Also, creating the association record explicitly is unusual. You could do something like 
      setlists.songs << song instead

    We can discuss this in case there's some subtlety here that I'm missing

    TODO: Revisit this
=end



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
    params.require(:song).permit(:title, :artist, :album, :spotify_url)
  end
end


