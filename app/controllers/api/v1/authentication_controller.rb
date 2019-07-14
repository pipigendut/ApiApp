class Api::V1::AuthenticationController < Api::V1::ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    user = User.find_by_email(params[:email])
    if user && user.valid_password?(params[:password])
      user.generate_token
      token_auth = user.token_auth
      render json: { token: Base64.decode64(token_auth.authentication_token), exp: token_auth.expired.strftime("%m-%d-%Y %H:%M"),
                     username: user.username, id: user.id}, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
