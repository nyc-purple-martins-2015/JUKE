class SpotifyPlaylistGetter < SpotifyGetter




  private

  def format_endpoint
    @args.fetch(:setlist).list_spotify_url
  end
end
