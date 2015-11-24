require 'rails_helper'

describe SetlistsController do



  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:spotify]
  end

  context "#new" do

    before(:each) {
      @setlist = FactoryGirl.create(:setlist)
    }

    it "assigns a new setlist" do
      get :new
      expect(assigns(@setlist)).to be_a_kind_of(Setlist)
    end
  end

end
