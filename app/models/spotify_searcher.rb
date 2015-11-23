class SpotifySearcher <SpotifyGetter

BASE_URL = "https://api.spotify.com"

  def initialize (token, query_array)
    @token = token
    @query_array = query_array
  end

  def self.parse_search_results(response)
    parsed = JSON.parse(response.body)
    t_array = parsed["tracks"]["items"]
    results = t_array.map do |t|
      artist_list = []
      t["artists"].each { |artist| artist_list << artist["name"] }

       {
        title: t["name"],
        artist: artist_list.join(", "),
        album: t["album"]["name"],
        url: t["href"],
        id: t["id"]
       }
    end
    results
  end

  private

    def format_endpoint
      altered_query = @query_array.split(" ").join("%20")
      BASE_URL + "/v1/search?q=#{altered_query}&limit=20&type=track"
    end

end
