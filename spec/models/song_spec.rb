require 'rails_helper'

RSpec.describe Song, type: :model do
  context "validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :artist}
    it { should validate_presence_of :album}
    it { should validate_presence_of :song_spotify_url}
  end
end
