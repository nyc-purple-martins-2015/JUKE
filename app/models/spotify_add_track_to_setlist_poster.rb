class SpotifyAddTrackToPlaylist < SpotifyPoster

  private

  def format_endpoint
     BASE_URL + "/v1/users/#{@args.fetch(:user).uid}/playlists/#{@args.fetch(:setlist).setlist_id}/tracks"
  end

  def payload
    { urls: @args.fetch(:songs).map(&:song_spotify_url) }
  end
end
