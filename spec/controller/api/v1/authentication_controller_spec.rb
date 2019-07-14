require 'rails_helper'

describe Api::V1::AuthenticationController, :type => :controller do
  let(:user) { create(:user) }

  describe "Login", :type => :request do
    before do
      post '/api/v1/auth/login', params: { :email => user.email, :password => 'password' }
    end
    it "returns correct status" do
      expect( response ).to have_http_status(:success)
    end
  end
end
