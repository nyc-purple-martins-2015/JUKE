class SpotifyGetter

  BASE_URL = "https://api.spotify.com"

  def initialize (token, args = {})
    @token = token
    @args = args
  end

  def get
    uri = URI(format_endpoint)
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = "Bearer #{@token}"
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end
    res
  end

  def self.parse_playlists(response)
    parsed = JSON.parse(response.body)
    parsed["items"].each_with_object([]) do |playlist, array|
      array << {name: playlist["name"], url: playlist["href"]}
    end
  end

  private

  def format_endpoint
  end

end
