class SpotifySearcher

BASE_URL = "https://api.spotify.com"

  def initialize (token, query_array)
    @token = token
    @query_array = query_array
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
      altered_query = @query_array.split(" ").join("%20")
      BASE_URL + "/v1/search?q=#{altered_query}&limit=20&type=track"
    end

end
