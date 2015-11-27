class SpotifyPlaylistGetter < SpotifyGetter




  private

  def format_endpoint
    @args.fetch(:setlist).spotify_url
  end
end
