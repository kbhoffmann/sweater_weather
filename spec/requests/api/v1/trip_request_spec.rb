require 'rails_helper'

RSpec.describe 'User Roadtrip' do
  it 'can return a json response of trip information for a start and end city request' do
    user =
    {
      "email": "kerri@example.com",
      "password": "password123",
      "password_confirmation": "password123"
    }
    post "/api/v1/users", params: user, as: :json

    login_params =
        {
          "email": "kerri@example.com",
          "password": "password123"
        }

    post "/api/v1/sessions", params: login_params, as: :json

    user = User.find_by(email: login_params[:email])

    trip_params =
        {
          "origin": "Denver, CO",
          "destination": "Milwaukee, WI",
          "api_key": "#{user.api_key}"
        }

    post "/api/v1/road_trip", params: trip_params, as: :json

    parsed_trip_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(parsed_trip_data).to be_a(Hash)
    expect(parsed_trip_data.length).to eq(1)
    expect(parsed_trip_data).to have_key(:data)
    expect(parsed_trip_data[:data]).to be_a(Hash)
    expect(parsed_trip_data[:data].length).to eq(3)
    expect(parsed_trip_data[:data]).to have_key(:id)
    expect(parsed_trip_data[:data][:id]).to eq(nil)
    expect(parsed_trip_data[:data]).to have_key(:type)
    expect(parsed_trip_data[:data][:type]).to eq("roadtrip")
    expect(parsed_trip_data[:data]).to have_key(:attributes)
    expect(parsed_trip_data[:data][:attributes]).to be_a(Hash)
    expect(parsed_trip_data[:data][:attributes].length).to eq(4)
    expect(parsed_trip_data[:data][:attributes]).to have_key(:start_city)
    expect(parsed_trip_data[:data][:attributes][:start_city]).to be_a(String)
    expect(parsed_trip_data[:data][:attributes][:start_city]).to eq("Denver,CO")
    expect(parsed_trip_data[:data][:attributes]).to have_key(:end_city)
    expect(parsed_trip_data[:data][:attributes][:end_city]).to be_a(String)
    expect(parsed_trip_data[:data][:attributes][:end_city]).to eq("Milwaukee,WI")
    expect(parsed_trip_data[:data][:attributes]).to have_key(:travel_time)
    expect(parsed_trip_data[:data][:attributes][:travel_time]).to be_a(String)
    expect(parsed_trip_data[:data][:attributes]).to have_key(:weather_at_eta)
    expect(parsed_trip_data[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(parsed_trip_data[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(parsed_trip_data[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(parsed_trip_data[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(parsed_trip_data[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end
end
