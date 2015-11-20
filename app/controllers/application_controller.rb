class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user, :logged_in?
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
    # do something with response
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

  protect_from_forgery with: :exception
end
