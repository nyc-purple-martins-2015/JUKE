class SetlistsController < ApplicationController

  def index

  end

  def edit
    @setlist = Setlist.find(params[:id])
    @setlist_songs = @setlist.setlist_songs.where(list_status: 0)
    @tracks = get_setlist_tracks(@setlist)
  end

  def show
    @setlist = Setlist.find(params[:id])
    @setlist_songs = @setlist.setlist_songs.where(list_status: [0, 1])
  end

  def create
    ensure_current_user
    setlist = Setlist.new(setlist_params)
    if setlist.save
      array_of_tracks_hash = get_setlist_tracks(setlist)
      tracks_not_loaded = []
      array_of_tracks_hash.each do |track_hash|
        song = Song.find_or_create_by(track_hash)
        setlist_song = SetlistSong.new(setlist: setlist, song: song, list_status: 2)
        tracks_not_loaded << setlist_song.title unless setlist_song.save
      end
      flash[:alert] = "The following songs were not loaded \n \n #{tracks_not_loaded.join(", ")}."
      redirect_to edit_setlist
    else
      # error case
    end
  end


  private

# we need a validation of some kind on the url...all setlists
# should be forced to have a valid list_spotify_url that attaches to spotify
  def setlist_params
    params.require(:setlist).permit(:name, :list_spotify_url, :invite_code, host: current_user)
  end

end
