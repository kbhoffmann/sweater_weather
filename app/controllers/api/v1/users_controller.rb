class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save
    render json: UserSerializer.user_json(user), status: 201

    #need to add 400 error codes and message in the body if email not unique
    #or passwords don't match etc.
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
