class SpotifyGetter
  extend Parsable

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

  private

  def format_endpoint
  end

end
