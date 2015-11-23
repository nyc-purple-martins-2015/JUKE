require 'rails_helper'

RSpec.describe UsersController do
  let(:sample_user) { FactoryGirl.build(:user)}

  context '#create' do
    it 'creates a new user with LOCAL_LOGIN params' do
      expect{
        post :create, user: FactoryGirl.attributes_for(:user)
      }.to change(User, :count).by(1)
    end

    it 'does not create a user when params are invalid' do
      expect{
        post :create, user: FactoryGirl.attributes_for(:setlist)
      }.to_not change(User, :count)
    end

    it 'redirects to the root_path when the user is successfully created' do
      expect(
        post :create, user: FactoryGirl.attributes_for(:user)
      ).to redirect_to root_path
    end

    it 'redirects to login_path when user is unsuccessfully created' do
      expect(
        post :create, user: FactoryGirl.attributes_for(:setlist)
      ).to redirect_to login_path
    end

  end

end




















  # context '#create' do

  #   it 'redirects to the root_path when the user is successfully created' do
  #     expect(
  #         post :create, user: FactoryGirl.attributes_for(:question)
  #     ).to redirect_to register_path
  #   end
  # end
