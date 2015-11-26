class VotesController < ApplicationController

def create
  @vote = Vote.new(vote_params)
  # You don't need to load setlitst_song here. It's available as @vote.setlist_song alreadys
  @setlist_song = SetlistSong.find(@vote.setlist_song_id)
  # This is fine but you could have done
  # @vote = current_user.votes.new(vote_params) in the first place
  @vote.user = current_user
  if @vote.save
    # You redirect to the same route in both cases so move it out of the if/else block
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
