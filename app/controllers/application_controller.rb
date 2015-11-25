class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
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
  # if i want to use this in view we should put this in helper

  def logged_in?
    !!current_user
  end

  #This should be removed when jon is ready

  ################

  def parse_emails(string)
    string.strip.split(",")
  end

  protect_from_forgery with: :exception
end
