require 'rails_helper'

RSpec.describe "User Session/Login Request" do
  it 'can create a session for a user at login' do
    user =
    {
      "email": "whatever@example.com",
      "password": "password123",
      "password_confirmation": "password123"
    }

    post "/api/v1/users", params: user, as: :json

    login_params =
        {
          "email": "whatever@example.com",
          "password": "password123"
        }

    post "/api/v1/sessions", params: login_params, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    parsed_session_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_session_response).to be_a(Hash)
    expect(parsed_session_response.length).to eq(1)
    expect(parsed_session_response).to have_key(:data)
    expect(parsed_session_response[:data]).to be_a(Hash)
    expect(parsed_session_response[:data]).to have_key(:type)
    expect(parsed_session_response[:data]).to have_key(:id)
    expect(parsed_session_response[:data]).to have_key(:attributes)
    expect(parsed_session_response[:data][:attributes]).to have_key(:email)
    expect(parsed_session_response[:data][:attributes]).to have_key(:api_key)
    expect(parsed_session_response[:data][:attributes][:api_key].length).to eq(32)
    expect(parsed_session_response[:data]).to_not have_key(:password)
    expect(parsed_session_response[:data]).to_not have_key(:password_confirmation)
  end

  xit 'returns and error and a 400 status code if unsuccessful' do
  end
end
