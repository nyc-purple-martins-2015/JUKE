class SpotifyPlaylistsGetter < SpotifyGetter

  private

  def format_endpoint
  BASE_URL + "/v1/users/#{@args.fetch(:user).uid}/playlists"
  end
end
