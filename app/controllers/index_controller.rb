class IndexController < ApplicationController

  # This is not necessary - you can just reference current_user in the view
  # It also actively hides from us in the view that we are talking about 
  # the current rather than some other user
  def home
    @user = current_user
  end

end
