require 'spec_helper'

RSpec.describe SessionsController, type: :controller do

  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:spotify]
  end

  describe "#create" do

    it "should successfully create a user" do
      expect {
        post :create, provider :spotify
      }.to change{ User.count }.by(1)
    end

  end

end
