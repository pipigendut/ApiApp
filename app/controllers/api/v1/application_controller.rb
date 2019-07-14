class Api::V1::ApplicationController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      token = Base64.encode64(header)
      token_auth = TokenAuth.find_by(authentication_token: token)
      @current_user = User.find(token_auth.user_id)
      if params[:username]
        if @current_user.username != params[:username]
          render json: { errors: "wrong user" }, status: :unauthorized
        end
      end
      return true
    rescue Exception => error
      render json: { errors: error.message }, status: :unauthorized
    end
  end
end
