require 'rails_helper'

describe Vote, type: :model do
  context "validations" do
    it { should validate_presence_of :user}
    it { should validate_presence_of :setlist_song}
  end

  context "#upvote" do
    let(:upvote) {FactoryGirl.build :upvote}
    it "sets the value of the vote to 1" do
      expect(upvote.value).to eq(1)
    end
  end

  context "#downvote" do
    let(:downvote) {FactoryGirl.build :downvote}
    it "sets the value of the vote to -1" do
      expect(downvote.value).to eq(-1)
    end
  end
end
