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

  private

  def create_request(uri)
    if @args[:request_type] == "put"
      # Your class is called SpotifyPoster but sometimes puts.....
      # Getter and poster may not need to be separate classes. 
      # They only differ in http verb and whether to read params or body
      # You could probably just have a single simple object with a
      # call_spotify(verb, url, hash_of_params) -> Hash method
      # i.e. that would return a hash of the json from spotify
      # If you were going to implement an object hierarchy 
      # for the spotify interactions you might as well have it go 
      # further and return objects. That would add some value
      # whereas having multiple classes just for the http part 
      # possibly doesn't.
      Net::HTTP::Put.new(uri)
    elsif @args[:request_type] == "delete"
      Net::HTTP::Delete.new(uri)
    else
      Net::HTTP::Post.new(uri)
    end
  end

  def format_endpoint

  end

  def payload

  end

end
