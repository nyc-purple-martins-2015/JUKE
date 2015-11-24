require 'rails_helper'

describe SessionsController do

  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:spotify]
  end

  describe "#new" do
    it "assigns a new user" do
      get :new
      expect(assigns(:user)).to be_a_kind_of(User)
    end
  end

  describe "#create" do
    it "should successfully create a user" do
      expect{
        post :create, provider: :spotify
      }.to change{ User.count }.by(1)
    end

    it "should successfully create a user" do
      expect(session[:user_id]).to be_nil
      expect{
        post :create, provider: :spotify
        session[:user_id]}.should_not be_nil # depracated
    end

    it "should redirect the user to the root url" do
        post :create, provider: :github
        expect(response).to redirect_to(home_path)
    end
  end

  xit 'should redirect to the home page' do
    delete :destroy
    expect(response).to redirect_to login_path
  end
end
