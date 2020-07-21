class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def login
    users = User.find_by(email: user_params[:email])
    render json: {status: '200', token: user.token}
    return
  end

  # POST /users
  def signup
    user = User.new(user_params)

    if user.save
      render json: {status: '200', token: user.token}
      return
    else
      render json: user.errors, status: '400'
      return
    end
  end

  def logout
    if users = User.find(current_user.id)
      render json: {status: '200'}
      return
    else
      render json: user.errors, status: '400'
      return
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:email, :password, :token)
    end
end
