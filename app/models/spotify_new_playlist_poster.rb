class SpotifyNewPlaylistPoster < SpotifyPoster


  private

  def format_endpoint
    BASE_URL + "/v1/users/#{@args.fetch(:user).uid}/playlists"
  end

  def payload
    { name: @args.fetch(:name) }
  end

end
