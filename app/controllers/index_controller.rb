class IndexController < ApplicationController

  def home
    if logged_in?
      @user = current_user
    else
      flash[:alert] = "Log in to access JUKE"
      redirect_to root_path
    end
  end

end
