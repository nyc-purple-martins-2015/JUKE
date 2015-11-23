class PlaylistsController < ApplicationController
  before_action :ensure_current_user

  def index
    # We call this a "magic string".  Why is ithere?  What does it mean.
    # The pattern i used earlier where we document it in a constant is called
    # "REPLACE MAGIC STRING WITH SYMBOLIC CONSTANT"
    res = spotify_get("https://api.spotify.com/v1/users/#{current_user.uid}/playlists")
    h = JSON.parse(res.body)
    ap h
    render text: h.inspect
  end
end
