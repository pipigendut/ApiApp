require 'rails_helper'

describe Api::V1::ApplicationController, :type => :controller do
  let(:user) { create(:user) }

  describe 'authorize_request' do
    context 'sign_in without token' do
      it 'it should return unauthorized' do
        # expect(controller.send(:authorize_request)).to eq false
      end
    end
  end

  describe "authorize_request", :type => :request do
    before do
      post '/api/v1/auth/login', params: { :email => user.email, :password => 'password' }
      # some code here
      authentication_token = Base64.decode64(user.token_auth.authentication_token)
      post '/api/v1/auth/login', as: :json, headers: {:Authorization => authentication_token}
    end
    it 'it should return unauthorized' do
      expect(controller.send(:authorize_request)).to eq true
    end
  end
end
