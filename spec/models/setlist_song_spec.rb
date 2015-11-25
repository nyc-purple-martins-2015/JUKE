require 'rails_helper'

RSpec.describe SetlistSong, type: :model do
  context "validations" do
    it { should validate_presence_of :song}
    it { should validate_presence_of :setlist}
  end

  context "#vote_count" do
    s_song = FactoryGirl.build :setlist_song

     s_song.votes << Vote.create!(user: FactoryGirl.build(:user), setlist_song: FactoryGirl.build(:setlist_song), value: 1)
     binding.pry

    it "should return the sum of the votes value" do
      expect(s_song.vote_count).to eq(1)
    end
  end
end
