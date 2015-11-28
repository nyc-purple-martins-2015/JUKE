class SpotifySearcher < SpotifyGetter

BASE_URL = "https://api.spotify.com"

  def initialize (token, query_array)
    @token = token
    @query_array = query_array
  end

  private

    def format_endpoint
      altered_query = @query_array.split(" ").join("%20")
      BASE_URL + "/v1/search?q=#{altered_query}&limit=20&type=track"
    end

end
