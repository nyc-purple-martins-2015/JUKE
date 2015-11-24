class SpotifyReorderPlaylistTracksPutter

  private

  def format_endpoint
    Base_URL + "/v1/users/#{@args.fetch(:user).uid}/playlists/#{@args.fetch(:setlist).spotify_id}/tracks"
  end

  def payload
    { range_start: @args.fetch(:range_start),range_length: @args.fetch(:range_length), insert_before: 0 }
  end

end
