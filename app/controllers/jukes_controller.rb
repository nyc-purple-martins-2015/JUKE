class JukesController < ApplicationController

  def new
    @setlist = Setlist.new
  end

end
