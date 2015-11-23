class SpotifyGetter
  USER_PLAYLIST_ENDPOINT = "https://api.spotify.com/v1/users/%s/playlists"

  def initialize(user, authorization_token)
    @user = user
    @authorization_token = authorization_token
  end

  def get
    uri = URI(endpoint_url)
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = "Bearer #{@authorization_token}"
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end
    response
  end

  private

    def endpoint_url
      raise "Expected user to have a uid" unless @user.uid
      sprintf(USER_PLAYLIST_ENDPOINT, @user.uid)
    end
end
