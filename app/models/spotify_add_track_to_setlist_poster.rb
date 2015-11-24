class SpotifyAddTrackToSetlistPoster < SpotifyPoster

  private

  def format_endpoint
     BASE_URL + "/v1/users/#{@args.fetch(:user).uid}/playlists/#{@args.fetch(:setlist).spotify_id}/tracks"
  end

  def payload
    # binding.pry
    {
      urls: @args.fetch(:setlist_songs).map{ |setlist_song| setlist_song.song.song_spotify_url }
    }
  end
end
