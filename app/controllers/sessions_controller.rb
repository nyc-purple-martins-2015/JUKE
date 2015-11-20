class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if request.env['omniauth.auth']
      create_from_social
    else
      create_from_local_login
    end
  end

  private

  def create_from_local_login
    u = User.find_by(username: params[:username], provider: LOCAL_LOGIN)
    if u && u.authenticate(params[:password])
      session[:user_id] = u.id
      session[:token] = auth_hash[:credentials][:token]
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def create_from_social
    auth_hash = request.env['omniauth.auth']
    ap auth_hash
    u = User.find_by uid: auth_hash[:uid], provider: auth_hash[:provider]
    if !u
      u = User.new(uid: auth_hash[:uid], provider: auth_hash[:provider])
      #Generate a random password so that has_secure_password doesn't prevent a save
      u.password = SecureRandom.uuid
    end
    u.email = auth_hash[:info][:email]
    u.username  = auth_hash[:info][:name]
   # u.image = auth_hash[:info][:image]
    u.save if u.changed?

    session[:user_id] = u.id
    session[:token] = auth_hash[:credentials][:token]
    redirect_to root_path
  end
end
