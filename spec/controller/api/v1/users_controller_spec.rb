require 'rails_helper'

describe Api::V1::UsersController, :type => :controller do
  let(:user) { create(:user) }

  describe "working correctly", :type => :request do
    before do
      post '/api/v1/auth/login', params: { :email => user.email, :password => 'password' }
      @authentication_token = Base64.decode64(user.token_auth.authentication_token)
    end

    describe 'GET new' do
      it 'response correctly 200' do
        get '/api/v1/users', as: :json, headers: {:Authorization => @authentication_token}
        expect(response.status).to eq 200
      end
    end

    describe 'GET show' do
      it 'response correctly 200' do
        get "/api/v1/users/#{user.username}", as: :json, headers: {:Authorization => @authentication_token}
        expect(response.status).to eq 200
      end
    end

    describe 'GET create' do
      it 'response correctly 200' do
        post "/api/v1/users", params: {
          email: 'userlast@gmail.com',
          username: 'userlast',
          password: 'password',
          password_confirmation: 'password'
        }
        expect(response.status).to eq 201
      end
    end

    describe 'PUT update' do
      it 'should update status' do
        put "/api/v1/users/#{user.username}", params: {
          email: "#{user.email}"
        }, headers: {:Authorization => @authentication_token}
        expect(response.status).to eq 204
      end
    end

    describe 'Show History' do
      it 'should update status' do
        get "/api/v1/#{user.username}/history", headers: {:Authorization => @authentication_token}
        expect(response.status).to eq 200
      end
    end

  end
end
