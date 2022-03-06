require 'rails_helper'

RSpec.describe "Forcast by city API endpoint" do
  it 'returns a json response of current,daily, and hourly weather data for a city' do

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
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:icon)

    expect(parsed_weather_data[:data][:attributes]).to have_key(:daily_weather)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:date)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:sunrise)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:sunset)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:max_temp)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:min_temp)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:conditions)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to have_key(:icon)

    expect(parsed_weather_data[:data][:attributes]).to have_key(:hourly_weather)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to have_key(:time)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to have_key(:temperature)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to have_key(:conditions)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to have_key(:icon)
  end
end
