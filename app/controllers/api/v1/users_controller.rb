class Api::V1::UsersController < Api::V1::ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index history]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  # get /api/v1/{username}/history
  def history
    render json: @current_user.purchases, status: :ok
  end

  private

  def find_user
    @user = User.find_by_username!(params[:username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
      :full_name, :username, :email, :date_of_birth, :address, :phone, :gender, :password, :password_confirmation
    )
  end
end
