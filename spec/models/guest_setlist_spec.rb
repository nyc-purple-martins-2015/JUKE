require 'rails_helper'

RSpec.describe GuestSetlist, type: :model do
  context "validations" do
    it { should validate_presence_of :guest}
    it { should validate_presence_of :setlist}
  end
end
