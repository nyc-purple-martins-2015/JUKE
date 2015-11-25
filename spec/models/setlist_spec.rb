require 'rails_helper'

RSpec.describe Setlist, type: :model do
  context "validations" do
    it { should validate_presence_of :host}
    it { should validate_presence_of :name}
    it { should validate_presence_of :spotify_url}
    it { should validate_presence_of :invite_code}
  end

  context "#spotify_id" do
    let(:setlist) {FactoryGirl.build :setlist}
    it "should not return a string of everything after the last '/'" do
      expect(setlist.spotify_id.include?("spotify.com")).to be(false)
    end
  end
end
