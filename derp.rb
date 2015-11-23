#!/usr/bin/env ruby

# POST https://api.spotify.com/v1/users/{user_id}/playlists
#
url = sprintf("https://api.spotify.com/v1/users/%s/playlists", "sgharms");
uri = URI(url)

http = Net::HTTP.new(uri.host, uri.port)

request = Net::HTTP::Post.new(uri)
request['Authorization'] = "Bearer #{}"

request.set_form_data(hash_of_params)
response = http.request(request)jk
