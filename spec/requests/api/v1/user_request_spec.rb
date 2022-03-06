require 'rails_helper'

RSpec.describe "Requests for User" do
  it 'can accept a post request to create a new user' do
    user_params =
    {
      "email": "whatever@example.com",
      "password": "password123",
      "password_confirmation": "password123"
    }
    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/users/", headers: headers, params: user_params, as: :json

    expect(response).to be_successful
    expect(User.last[:email]).to eq("whatever@example.com")
  end
end
