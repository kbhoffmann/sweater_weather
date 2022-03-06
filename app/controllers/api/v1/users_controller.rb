class Api::V1::UsersController < ApplicationController
  def create
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    binding.pry
  end
end
