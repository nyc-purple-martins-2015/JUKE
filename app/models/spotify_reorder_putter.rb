class SpotifyReorderPutter < SpotifyPoster

  def format_endpoint
    BASE_URL + "/v1/users/#{@args.fetch(:user).uid}/playlists/#{@args.fetch(:setlist).spotify_id}/tracks"
  end

  def payload
    { range_start: @args[:range_start], insert_before: @args[:insert_before], range_length: @args[:range_length]}
  end
end
