class PlaylistsController < ApplicationController
  before_action :ensure_current_user

  def index
    res = spotify_get("https://api.spotify.com/v1/users/#{current_user.uid}/playlists")
    render json:res.body
  end
end
