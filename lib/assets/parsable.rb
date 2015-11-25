module Parsable

  def parse_playlists(response)
    parsed = JSON.parse(response.body)
    parsed["items"].each_with_object([]) do |playlist, array|
      array << {name: playlist["name"], url: playlist["href"]}
    end
  end

  def parse_search_results(response)
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

  def parse_playlist(json)
    parsed = JSON.parse(json.body)
    t_array = parsed["tracks"]["items"]

    tracks = t_array.map do |t|
      artist_list = []
      t["track"]["artists"].each { |artist| artist_list << artist["name"] }
      {
        title: t["track"]["name"],
        song_spotify_url: t["track"]["href"],
        album: t["track"]["album"]["name"],
        artist: artist_list.join(", ")
      }
    end

    tracks
  end

end
