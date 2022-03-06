require 'rails_helper'

RSpec.describe "Forcast by city API endpoint" do
  it 'returns a json response of current,daily, and hourly weather data for a city' do
    coord_response = File.read('spec/fixtures/map_geocoding_data.json')
    stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=UHerve0fkvZVNWgBwQzNhk9nhiz3gtWX&location=denver,co").
    to_return(status: 200, body: coord_response, headers: {})

    weather_response = File.read('spec/fixtures/request_weather_data.json')
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=b223e219a2cff0890dbe4fae9e6d5836&exclude=minutely,alerts&lat=39.738453&lon=-104.984853&units=imperial").
    to_return(status: 200, body: weather_response, headers: {})

    location = "denver,co"

    get "/api/v1/forecast?location=#{location}"
    parsed_weather_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(parsed_weather_data.length).to eq(1)
    expect(parsed_weather_data[:data]).to have_key(:id)
    expect(parsed_weather_data[:data][:id]).to eq(nil)
    expect(parsed_weather_data[:data]).to have_key(:type)
    expect(parsed_weather_data[:data][:type]).to eq("forecast")
    expect(parsed_weather_data[:data]).to have_key(:attributes)
    expect(parsed_weather_data[:data][:attributes].length).to eq(3)
    expect(parsed_weather_data[:data][:attributes]).to have_key(:current_weather)
    expect(parsed_weather_data[:data][:attributes][:current_weather].length).to eq(10)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:datetime]).be_a(String)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to_not have_key(:date)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to_not have_key(:time)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:sunrise]).be_a(String)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:sunset]).be_a(String)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:temperature]).be_a(Float)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:feels_like]).be_a(Float)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:conditions]).be_a(String)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:icon]).be_a(String)

    expect(parsed_weather_data[:data][:attributes]).to have_key(:daily_weather)
    expect(parsed_weather_data[:data][:attributes][:daily_weather].length).to eq(7)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:date)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to_not have_key(:datetime)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to_not have_key(:time)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:sunrise)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:sunset)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:max_temp)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:min_temp)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:conditions)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:icon)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to_not have_key(:temperature)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to_not have_key(:feels_like)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to_not have_key(:humidity)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to_not have_key(:uvi)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to_not have_key(:visibility)

    expect(parsed_weather_data[:data][:attributes]).to have_key(:hourly_weather)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather].length).to eq(4)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to have_key(:time)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather][:time]).be_a(String)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to_not have_key(:datetime)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to_not have_key(:date)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to have_key(:temperature)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather][:temperature]).be_a(Float)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to have_key(:conditions)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather][:conditions]).be_a(String)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to have_key(:icon)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather][:icon]).be_a(String)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to_not have_key(:sunrise)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to_not have_key(:sunset)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to_not have_key(:feels_like)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to_not have_key(:humidity)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to_not have_key(:uvi)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to_not have_key(:visibility)
  end
end
