class SpotifyAddTracksToPlaylistPoster < SpotifyPoster

  private

  def format_endpoint
     BASE_URL + "/v1/users/#{@args.fetch(:user).uid}/playlists/#{@args.fetch(:setlist).spotify_id}/tracks"
  end

  def payload
    tracks = @args.fetch(:setlist_songs).map do |setlist_song|
      {"uri" => "spotify:track:" + setlist_song.song.spotify_id }
    end
    { tracks: tracks }
  end
end
