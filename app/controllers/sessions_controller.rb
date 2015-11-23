class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

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

  def destroy
    session.clear
    redirect_to login_path
  end


  private

  def create_from_local_login
    u = User.find_by(username: params[:user][:username], provider: LOCAL_LOGIN)

    if u && u.authenticate(params[:user][:password])
      session[:user_id] = u.id
      redirect_to home_path
    else
      flash[:notice] = 'Invalid username/password combination. Please try again.'
      redirect_to login_path
    end
  end

  def create_from_social
    auth_hash = request.env['omniauth.auth']
    u = User.find_by(uid: auth_hash[:uid])
    if !u
      u=User.new(uid: auth_hash[:uid], provider: auth_hash[:provider])
      u.password = SecureRandom.uuid
      u.email = auth_hash[:info][:email]
      u.username = auth_hash[:info][:name]
      u.save!
    end

    session[:user_id] = u.id
    session[:token] = auth_hash[:credentials][:token]
    redirect_to home_path
  end

end
