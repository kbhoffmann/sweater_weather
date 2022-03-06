class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save
    render json: UserSerializer.user_json(user)
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
