class Api::V1::UsersController < ApplicationController
  before_action :current_user, only: [:login, :logout]

  # POST /users
  def login
    user = User.find_by(email: current_user.email)
    unless user == nil
      render json: {status: '200', token: user.token}
    else 
      render json: {status: '400', message: "パラメーターが不正です"} 
    end
  end

  # POST /users
  def signup
    user = User.new(user_params)

    if user.save
      render json: {status: 200, token: user.token}
    else
      render json: {status: 400, message: "パラメーターが不正です"} 
    end
  end

  def logout
    if users = User.find(current_user.id)
      render json: {status: 200}
    else
      render json: {status: 400, message: "パラメーターが不正です"} 
    end
  end

  private
    def user_params
      params.permit(:email, :password, :token)
    end
end
