class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def login
    @users = User.where(email: user_params[:email])
    render json: {status: '200', token: @user.token}
    return
  end

  # POST /users
  def signup
    @user = User.new(user_params)

    if @user.save
      render json: {status: '200', token: @user.token}
      return
    else
      render json: @user.errors, status: '400'
      return
    end
  end

  def logout
    if @users = User.where(email: user_params[:email])
      render json: {status: '200'}
      return
    else
      render json: @user.errors, status: '400'
      return
    end
  end


  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
      return
    else
      render json: @user.errors, status: :unprocessable_entity
      return
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:email, :password, :token)
    end
end
