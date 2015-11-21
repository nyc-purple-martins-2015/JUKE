require 'rails_helper'

RSpec.describe SetlistSong, type: :model do
  context "validations" do
    it { should validate_presence_of :song}
    it { should validate_presence_of :setlist}
  end
end
