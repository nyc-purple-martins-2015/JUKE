require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of :username}
    # Proptip: @example.com is reserved for testing.
    it { should allow_value('LeKobe@devbootcamp.com').for(:email) }
    it { should_not allow_value('badlyFormattedEmail').for(:email) }
  end
end
