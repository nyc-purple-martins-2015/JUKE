class SpotifyPoster
  extend Parsable

  BASE_URL = "https://api.spotify.com"

  def initialize(token, args)
    @token = token
    @args = args
  end

  def post
    uri = URI(format_endpoint)
    http = Net::HTTP.new(uri.host, uri.port)

    req = create_request(uri)

    req['Authorization'] = "Bearer #{@token}"
    req['Content-Type'] = "application/json"
    req.body = payload.to_json
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end
    response
  end

  protected

  def create_request(uri)
      Net::HTTP::Post.new(uri)
  end

  private

  def format_endpoint

  end

  def payload

  end

end
