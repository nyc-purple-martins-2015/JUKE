class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def create
     @user = User.new(user_params)
     @user.provider = LOCAL_LOGIN
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      @errors = @user.errors.full_messages
      render "/sessions/new"
    end
  end

  def edit
    render "edit", layout: false
  end

  def destroy
    User.destroy_all(id: current_user.id)
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end

