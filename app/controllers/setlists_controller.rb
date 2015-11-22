class SetlistsController < ApplicationController

  def index

  end

  def new
    ensure_current_user
    @setlist = Setlist.new
    res = spotify_get("https://api.spotify.com/v1/users/#{current_user.uid}/playlists")
    parsed = JSON.parse(res.body)
    @playlists = []
    parsed["items"].each do |playlist|
      @playlists << {name: playlist["name"], url: playlist["href"]}
    end
  end

  def edit
    @setlist = Setlist.find(params[:id])
    # @setlist_songs = @setlist.setlist_songs.where(list_status: 0)
    @tracks = get_setlist_tracks(@setlist)
  end

  def show
    @setlist = Setlist.find(params[:id])
    @setlist_songs = @setlist.setlist_songs.where(list_status: [0, 1])
  end

  def update
    @setlist = Setlist.find(params[:id])
    binding.pry
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
      redirect_to edit_setlist_path(setlist)
    else
      flash[:alert] = "I'm sorry but we were unable to use that setlist"
      redirect_to new_setlist_path
    end
  end

  def join
    if @setlist = Setlist.find_by(invite_code: params[:invite_code])
      redirect_to setlist_path(@setlist)
    else
      flash[:alert] = "Incorrect Invite Code!"
      redirect_to root_path
    end
  end

  private

# we need a validation of some kind on the url...all setlists
# should be forced to have a valid list_spotify_url that attaches to spotify
  def setlist_params
    params.require(:setlist).permit(:name, :list_spotify_url, :invite_code).merge(host: current_user)
  end

  def setlist_songs_params
    params.require(:setlist).require(:setlist_song).permit(:id)
  end
end
