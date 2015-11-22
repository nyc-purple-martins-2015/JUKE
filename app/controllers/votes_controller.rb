class VotesController < ApplicationController

def create
  @vote = Vote.new(vote_params)
  @setlist_song = SetlistSong.find(@vote.setlist_song_id)
  @vote.user = current_user
  if @vote.save
    redirect_to setlist_path(@setlist_song.setlist)
  else
    flash[:alert] = "you already voted"
    redirect_to setlist_path(@setlist_song.setlist)
  end
end

private

  def vote_params
    params.require(:vote).permit(:value, :setlist_song_id)
  end
end
