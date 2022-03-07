class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.user_json(user)
    else
      render :json => { errors: "Bad Credentials" }, status: 401
    end
  end
end
