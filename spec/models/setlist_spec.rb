require 'rails_helper'

RSpec.describe Setlist, type: :model do
  context "validations" do
    it { should validate_presence_of :host}
    it { should validate_presence_of :name}
    it { should validate_presence_of :list_spotify_url}
    it { should validate_presence_of :invite_code}
  end
end
