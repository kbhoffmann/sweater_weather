require 'rails_helper'

RSpec.describe "Forcast by city API endpoint" do
  it '' do
    location = "denver,co"

    get "/api/vi/forecast?location=#{location}"
    parsed_request = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(parsed_request.length).to eq(1)
    expect(parsed_request[:data]).to have_key(:id)
    expect(parsed_request[:data][:id]).to eq(nil)
    expect(parsed_request[:data]).to have_key(:type)
    expect(parsed_request[:data][:type]).to eq("forecast")
    expect(parsed_request[:data]).to have_key(:attributes)
    expect(parsed_request[:data][:attributes].length).to eq(3)
    expect(parsed_request[:data][:attributes]).to have_key(:current_weather)
    expect(parsed_request[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(parsed_request[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(parsed_request[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(parsed_request[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(parsed_request[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(parsed_request[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(parsed_request[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(parsed_request[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(parsed_request[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(parsed_request[:data][:attributes][:current_weather]).to have_key(:icon)

    expect(parsed_request[:data][:attributes]).to have_key(:daily_weather)
    expect(parsed_request[:data][:attributes][:daily_weather]).to have_key(:date)
    expect(parsed_request[:data][:attributes][:daily_weather]).to have_key(:sunrise)
    expect(parsed_request[:data][:attributes][:daily_weather]).to have_key(:sunset)
    expect(parsed_request[:data][:attributes][:daily_weather]).to have_key(:max_temp)
    expect(parsed_request[:data][:attributes][:daily_weather]).to have_key(:min_temp)
    expect(parsed_request[:data][:attributes][:daily_weather]).to have_key(:conditions)
    expect(parsed_request[:data][:attributes][:daily_weather]).to have_key(:icon)

    expect(parsed_request[:data][:attributes]).to have_key(:hourly_weather)
    expect(parsed_request[:data][:attributes][:hourly_weather]).to have_key(:time)
    expect(parsed_request[:data][:attributes][:hourly_weather]).to have_key(:temperature)
    expect(parsed_request[:data][:attributes][:hourly_weather]).to have_key(:conditions)
    expect(parsed_request[:data][:attributes][:hourly_weather]).to have_key(:icon)
  end
end
