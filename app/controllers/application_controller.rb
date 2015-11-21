class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user, :logged_in?, :ensure_current_user
  LOCAL_LOGIN = 'LOCAL_LOGIN'

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def spotify_post(endpoint_url, hash_of_params)
    uri = URI(endpoint_url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri)
    request.set_form_data(hash_of_params)
    response = http.request(request)
  end

  def spotify_get(endpoint_url)
    uri = URI(endpoint_url)
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = "Bearer #{session[:token]}"
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end
    res
  end

  def ensure_current_user
    redirect_to ouath_login_path('spotify') unless current_user
  end

  def get_setlist_tracks(setlist)
    json = spotify_get(setlist.list_spotify_url)
    parsed = JSON.parse(json.body)
    t_array = parsed["tracks"]["items"]

    tracks = t_array.map do |t|
      artist_list = []
      t["track"]["artists"].each { |artist| artist_list << artist["name"] }
      {
        name: t["track"]["name"],
        song_spotify_url: t["track"]["href"],
        album: t["track"]["album"]["name"],
        artist: artist_list.join(", ")
      }
    end

    tracks
  end

  protect_from_forgery with: :exception
end
