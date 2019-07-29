require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:weather) { create(:weather) }
  let(:city) { create(:city, weather: weather) }

  describe 'not signed user' do
    it 'redirects to login path' do
      get :index

      expect(response).to redirect_to('/login')
    end
  end
  describe 'signed user' do
    before do
      sign_in
    end

    describe 'GET #index' do
      it 'returns http success' do
        get :index
        expect(response).to be_successful
      end
    end

    describe 'GET #create' do
      it 'creates post' do
        expect do
          post :create, params: { create_post_form: { city_name: 'Warszawa', note: 'a' } }
        end.to change(Post, :count).by(1)
        expect(response).to have_http_status(:redirect)
      end

      it 'renders index' do
        expect do
          post :create, params: { create_post_form: { city_name: 'Warszawa', note: '' } }
        end.to_not change(Post, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    describe 'GET #edit' do
      it 'edit post' do
        post = Post.create!(note: 'a', user: user, city: city)
        get :edit, params: { id: post }
        expect(response).to be_successful
        expect(assigns(:post)).to eq(post)
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes post' do
        post = Post.create!(note: 'a', user: user, city: city)

        expect do
          delete :destroy, params: { id: post }, format: :js
        end.to change(Post, :count).by(-1)
        expect(response).to be_successful
      end

      it 'destroy post and redirects ' do
        post = Post.create!(note: 'a', user: user, city: city)
        expect do
          delete :destroy, params: { id: post }
        end.to change(Post, :count).by(-1)
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
