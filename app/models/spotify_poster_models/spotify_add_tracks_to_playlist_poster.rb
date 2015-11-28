class SpotifyAddTracksToPlaylistPoster < SpotifyPoster

  private

  def format_endpoint
     BASE_URL + "/v1/users/#{@args.fetch(:user).uid}/playlists/#{@args.fetch(:setlist).spotify_id}/tracks"
  end

  def payload
    song_uris = @args.fetch(:setlist_songs).map{ |setlist_song| "spotify:track:" + setlist_song.song.spotify_id }
    { uris: song_uris }
  end
end
