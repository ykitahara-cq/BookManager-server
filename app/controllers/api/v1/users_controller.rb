class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def login
    if users = User.find_by(email: user_params[:email])
      render json: {status: '200', token: user.token}
    else 
      render json: user.errors, status: '400'
    end
  end

  # POST /users
  def signup
    user = User.new(user_params)

    if user.save
      render json: {status: '200', token: user.token}
    else
      render json: user.errors, status: '400'
    end
  end

  def logout
    if users = User.find(current_user.id)
      render json: {status: '200'}
    else
      render json: user.errors, status: '400'
    end
  end

  private
    def user_params
      params.permit(:email, :password, :token)
    end
end
