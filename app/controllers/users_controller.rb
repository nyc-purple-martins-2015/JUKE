class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def create
     @user = User.new(user_params)
     @user.provider = LOCAL_LOGIN
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
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

