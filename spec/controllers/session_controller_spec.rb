require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  describe '#create' do
    it 'should successfully create a user' do
      expect do
        get :create, params: { provider: :google_oauth2 }
      end.to change(User, :count).by(1)
    end

    it 'should successfully create a session' do
      expect(session[:user_id]).to be_falsy
      get :create, params: { provider: :google_oauth2 }
      expect(session[:user_id]).to be_truthy
    end

    it 'should redirect the user to the root url' do
      get :create, params: { provider: :google_oauth2 }
      expect(response).to redirect_to posts_path
    end
  end

  describe '#destroy' do
    before do
      get :create, params: { provider: :google_oauth2 }
    end

    it 'should clear the session' do
      expect(session[:user_id]).to be_truthy
      delete :destroy
      expect(session[:user_id]).to be_falsy
    end

    it 'should redirect to the home page' do
      delete :destroy
      expect(response).to redirect_to root_url
    end
  end
end
