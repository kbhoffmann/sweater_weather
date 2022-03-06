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

    post "/api/v1/users", params: user, as: :json

    expect(User.last[:email]).to eq("whatever@example.com")

    parsed_user_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    expect(parsed_user_response).to be_a(Hash)
    expect(parsed_user_response.length).to eq(1)
    expect(parsed_user_response).to have_key(:data)
    expect(parsed_user_response[:data]).to be_a(Hash)
    expect(parsed_user_response[:data].length).to eq(3)
    expect(parsed_user_response[:data]).to have_key(:type)
    expect(parsed_user_response[:data][:type]).to eq("users")
    expect(parsed_user_response[:data]).to have_key(:id)
    expect(parsed_user_response[:data][:id]).to eq(1)
    expect(parsed_user_response[:data]).to have_key(:attributes)
    expect(parsed_user_response[:data][:attributes]).to be_a(Hash)
    expect(parsed_user_response[:data][:attributes]).to have_key(:email)
    expect(parsed_user_response[:data][:attributes][:email]).to be_a(String)
    expect(parsed_user_response[:data][:attributes]).to have_key(:api_key)
    expect(parsed_user_response[:data][:attributes][:api_key]).to be_a(String)
    expect(parsed_user_response[:data]).to_not have_key(:password)
    expect(parsed_user_response[:data]).to_not have_key(:password_confirmation)
  end

  xit 'returns an error if password and password confirmation not matching' do
  end

  xit 'returns an error if email is not unique' do
  end
end
