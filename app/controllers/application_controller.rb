class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?
  LOCAL_LOGIN = 'LOCAL_LOGIN'

  before_action :require_login

  def require_login
    unless logged_in?
      flash[:error] = "Log in to access JUKE"
      redirect_to root_path
    end
  end

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def parse_emails(string)
    string.strip.split(",")
  end

  protect_from_forgery with: :exception
end
