class UsersController < ApplicationController

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      flash[:alert] = "Log in to access JUKE"
      redirect_to root_path
    end
  end

  def create
     @user = User.new(user_params)
     @user.provider = LOCAL_LOGIN
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end

