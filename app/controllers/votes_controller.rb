class VotesController < ApplicationController

def create
  @user = current_user
  @vote = Vote.new(vote_params)
  @setlist_song = SetlistSong.find(@vote.setlist_song_id)
  @vote.user_id = @user.id
  if @vote.first_vote?(@user, @setlist_song) && @vote.save
    redirect_to setlist_path(@setlist_song)
  else
    flash[:alert] = "You have already voted for this song!"
    redirect_to setlist_path(@setlist_song)
  end
end

private

  def vote_params
    params.require(:vote).permit(:value, :setlist_song_id)
  end

end
