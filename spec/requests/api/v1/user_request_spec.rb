require 'rails_helper'

RSpec.describe "Requests for User" do
  it 'can accept a post request to create a new user' do
    user =
    {
      "email": "whatever@example.com",
      "password": "password123",
      "password_confirmation": "password123"
    }
    # headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/users/", params: user

    expect(User.last[:email]).to eq("whatever@example.com")

    # json_response = JSON.parse(response.body, symbolize_names: true)
    #
    # expect(response).to be_successful
  end
end
