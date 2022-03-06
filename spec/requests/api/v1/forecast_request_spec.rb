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

    expect(parsed_weather_data).to be_a(Hash)
    expect(parsed_weather_data.length).to eq(1)
    expect(parsed_weather_data).to have_key(:data)
    expect(parsed_weather_data[:data]).to be_a(Hash)
    expect(parsed_weather_data[:data].length).to eq(3)
    expect(parsed_weather_data[:data]).to have_key(:id)
    expect(parsed_weather_data[:data][:id]).to eq(nil)
    expect(parsed_weather_data[:data]).to have_key(:type)
    expect(parsed_weather_data[:data][:type]).to eq("forecast")
    expect(parsed_weather_data[:data]).to have_key(:attributes)
    expect(parsed_weather_data[:data][:attributes]).to be_a(Hash)
    expect(parsed_weather_data[:data][:attributes].length).to eq(3)

    expect(parsed_weather_data[:data][:attributes]).to have_key(:current_weather)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to be_a(Hash)
    expect(parsed_weather_data[:data][:attributes][:current_weather].length).to eq(10)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:datetime]).to be_a(String)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to_not have_key(:date)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to_not have_key(:time)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:sunset]).to be_a(String)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:conditions]).to be_a(String)
    expect(parsed_weather_data[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(parsed_weather_data[:data][:attributes][:current_weather][:icon]).to be_a(String)

    expect(parsed_weather_data[:data][:attributes]).to have_key(:daily_weather)
    expect(parsed_weather_data[:data][:attributes][:daily_weather]).to be_an(Array)
    expect(parsed_weather_data[:data][:attributes][:daily_weather].length).to eq(5)

    days = parsed_weather_data[:data][:attributes][:daily_weather]

    days.each do |day|
      expect(day).to be_a(Hash)
      expect(day.length).to eq(7)
      expect(day).to have_key(:date)
      expect(day).to_not have_key(:datetime)
      expect(day).to_not have_key(:time)
      expect(day).to have_key(:sunrise)
      expect(day).to have_key(:sunset)
      expect(day).to have_key(:max_temp)
      expect(day).to have_key(:min_temp)
      expect(day).to have_key(:conditions)
      expect(day).to have_key(:icon)
      expect(day).to_not have_key(:temperature)
      expect(day).to_not have_key(:feels_like)
      expect(day).to_not have_key(:humidity)
      expect(day).to_not have_key(:uvi)
      expect(day).to_not have_key(:visibility)
    end

    expect(parsed_weather_data[:data][:attributes]).to have_key(:hourly_weather)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather]).to be_an(Array)
    expect(parsed_weather_data[:data][:attributes][:hourly_weather].length).to eq(8)

    hours = parsed_weather_data[:data][:attributes][:hourly_weather]

    hours.each do |hour|
      expect(hour).to be_a(Hash)
      expect(hour.length).to eq(4)
      expect(hour).to have_key(:time)
      expect(hour[:time]).to be_a(String)
      expect(hour).to_not have_key(:datetime)
      expect(hour).to_not have_key(:date)
      expect(hour).to have_key(:temperature)
      expect(hour[:temperature]).to be_a(Float)
      expect(hour).to have_key(:conditions)
      expect(hour[:conditions]).to be_a(String)
      expect(hour).to have_key(:icon)
      expect(hour[:icon]).to be_a(String)
      expect(hour).to_not have_key(:sunrise)
      expect(hour).to_not have_key(:sunset)
      expect(hour).to_not have_key(:feels_like)
      expect(hour).to_not have_key(:humidity)
      expect(hour).to_not have_key(:uvi)
      expect(hour).to_not have_key(:visibility)
    end
  end
end
