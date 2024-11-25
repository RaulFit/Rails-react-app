require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }

  describe 'GET /show' do
    it 'returns status code 200' do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'returns the user' do
      get user_path(user)
      expect(json).to eq(user.attributes.as_json)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:user_params) { attributes_for(:user) }

      before do
        post users_path, params: { user: user_params }
      end
      
      it 'returns the name' do
        expect(json['name']).to eq(user_params[:name])
      end

      it 'returns the email' do
        expect(json['email']).to eq(user_params[:email])
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post users_path, params: { user: attributes_for(:user, name: nil) }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end