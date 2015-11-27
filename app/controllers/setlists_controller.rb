class SetlistsController < ApplicationController

  def index
  end

  def new
    @setlist = Setlist.new
    res = SpotifyPlaylistsGetter.new(session[:token], user: current_user).get
    @playlists = SpotifyGetter.parse_playlists(res)
  end

  def edit
    @setlist = Setlist.find(params[:id])
  end

  def invite
    @setlist = Setlist.find(params[:setlist_id])
    render partial: "invite", local: {setlist: @setlist}
  end

  def send_invites
    @setlist = Setlist.find(params[:setlist_id])
    parse_emails(params[:send]).each do |email|
      UserMailer.invite_email(email, @setlist).deliver
    end
    redirect_to edit_setlist_path(@setlist)
  end

  def show
    @vote = Vote.new
    @setlist = Setlist.find(params[:id])
    @setlist_songs = @setlist.setlist_songs
  end

  def update
    @setlist = Setlist.find(params[:id])
    suggested_songs = []
    params[:setlist_songs].each { |setlist_song_id| suggested_songs << SetlistSong.find_by(id: setlist_song_id)}
    SpotifyAddTracksToPlaylistPoster.new(session[:token], {setlist: @setlist, setlist_songs: suggested_songs, user: current_user }).post
    suggested_songs.each{|setlist_song| setlist_song.update_attributes(list_status: 2)}
    redirect_to edit_setlist_path
  end

  def create

    if params[:setlist][:new_setlist]
      result =SpotifyNewPlaylistPoster.new(session[:token], { user: current_user, name: params[:setlist][:name] }).post
    end
    setlist = Setlist.new(setlist_params)
    if setlist.save
      json = SpotifyPlaylistGetter.new(session[:token], setlist: setlist).get
      array_of_tracks_hash = SpotifyGetter.parse_playlist(json)
      setlist.tracks_from_setlist(array_of_tracks_hash)
      redirect_to edit_setlist_path(setlist)
    else
      redirect_to new_setlist_path
    end
  end

  def join
    if @setlist = Setlist.find_by(invite_code: params[:invite_code])
      @guest_list = @setlist.guest_setlists.find_or_create_by(guest: current_user, setlist: @setlist)
      redirect_to setlist_path(@setlist)
    else
      flash[:alert] = "Incorrect Invite Code!"
      redirect_to home_path
    end
  end

  def reorder
    @setlist = Setlist.find(params[:id])
    response = SpotifyPlaylistGetter.new(session[:token], setlist: @setlist).get
    json = JSON.parse(response.body)
    sorted_setlist = @setlist.sort_by_votecount
    SpotifyTracksDeleter.new(session[:token], {request_type: "delete", setlist_songs: sorted_setlist, user: current_user, setlist: @setlist}).post
    SpotifyAddTracksToPlaylistPoster.new(session[:token], {setlist: @setlist, setlist_songs: sorted_setlist, user: current_user }).post
    redirect_to edit_setlist_path(@setlist)
  end

  def player
    @setlist = Setlist.find(params[:setlist_id])
  end

  private

  def setlist_params
    params.require(:setlist).permit(:name, :spotify_url, :invite_code).merge(host: current_user)
  end
end
