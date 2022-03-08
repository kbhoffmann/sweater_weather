require 'rails_helper'

RSpec.describe 'User Roadtrip' do
  it 'can return a json response of trip information for a start and end city request' do
    trip_json_response = File.read('spec/fixtures/trip_route_data.json')
    stub_request(:get, "http://www.mapquestapi.com/directions/v2/route?from=Denver,%20CO&key=UHerve0fkvZVNWgBwQzNhk9nhiz3gtWX&to=Milwaukee,%20WI").
    to_return(status: 200, body: trip_json_response, headers: {})

    coords_json_response = File.read('spec/fixtures/coords_destination_data.json')
    stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=UHerve0fkvZVNWgBwQzNhk9nhiz3gtWX&location=Milwaukee,%20WI").
    to_return(status: 200, body: coords_json_response, headers: {})

    eta_weather_json_response = File.read('spec/fixtures/eta_weather_data.json')
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=b223e219a2cff0890dbe4fae9e6d5836&exclude=minutely,alerts&lat=43.041072&lon=-87.909421&units=imperial").
    to_return(status: 200, body: eta_weather_json_response, headers: {})

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
    expect(parsed_trip_data[:data][:attributes][:start_city]).to eq("Denver, CO")
    expect(parsed_trip_data[:data][:attributes]).to have_key(:end_city)
    expect(parsed_trip_data[:data][:attributes][:end_city]).to be_a(String)
    expect(parsed_trip_data[:data][:attributes][:end_city]).to eq("Milwaukee, WI")
    expect(parsed_trip_data[:data][:attributes]).to have_key(:travel_time)
    expect(parsed_trip_data[:data][:attributes][:travel_time]).to be_a(String)
    expect(parsed_trip_data[:data][:attributes]).to have_key(:weather_at_eta)
    expect(parsed_trip_data[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(parsed_trip_data[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(parsed_trip_data[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(parsed_trip_data[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(parsed_trip_data[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end

  it 'requires an API key is provided in the request, otherwise returns a 401 error code' do
    trip_json_response = File.read('spec/fixtures/trip_route_data.json')
    stub_request(:get, "http://www.mapquestapi.com/directions/v2/route?from=Denver,%20CO&key=UHerve0fkvZVNWgBwQzNhk9nhiz3gtWX&to=Milwaukee,%20WI").
    to_return(status: 200, body: trip_json_response, headers: {})

    coords_json_response = File.read('spec/fixtures/coords_destination_data.json')
    stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=UHerve0fkvZVNWgBwQzNhk9nhiz3gtWX&location=Milwaukee,%20WI").
    to_return(status: 200, body: coords_json_response, headers: {})

    eta_weather_json_response = File.read('spec/fixtures/eta_weather_data.json')
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=b223e219a2cff0890dbe4fae9e6d5836&exclude=minutely,alerts&lat=43.041072&lon=-87.909421&units=imperial").
    to_return(status: 200, body: eta_weather_json_response, headers: {})

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
          "api_key": ""
        }

    post "/api/v1/road_trip", params: trip_params, as: :json

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful

    expect(response.status).to eq(401)
    expect(parsed_response[:errors]).to eq("You Must Provide an API key")
  end

  xit 'does not return a weather block for impossible route and returns impossible for travel time' do
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
          "destination": "Zurich, Switzerland",
          "api_key": "#{user.api_key}"
        }

    post "/api/v1/road_trip", params: trip_params, as: :json

    parsed_trip_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  end
end
