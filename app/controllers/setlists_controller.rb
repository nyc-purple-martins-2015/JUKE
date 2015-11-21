class SetlistsController < ApplicationController

  def new
    @setlist = Setlist.new
  end

end
