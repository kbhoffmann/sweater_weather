require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'sends information to the Current Weather poro' do
    json_response = File.read('spec/fixtures/request_weather_data.json')
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=b223e219a2cff0890dbe4fae9e6d5836&exclude=minutely,alerts&lat=39.738453&lon=-104.984853&units=imperial").
    to_return(status: 200, body: json_response, headers: {})

    latitude = 39.738453
    longitude = -104.984853

    expect(WeatherFacade.current_weather(latitude, longitude)).to be_a(CurrentWeather)
  end

  it 'sends information to the Daily Weather poro' do
    json_response = File.read('spec/fixtures/request_weather_data.json')
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=b223e219a2cff0890dbe4fae9e6d5836&exclude=minutely,alerts&lat=39.742043&lon=-104.991531&units=imperial").
    to_return(status: 200, body: json_response, headers: {})

    latitude = 39.742043
    longitude = -104.991531

    expect(WeatherFacade.five_day_weather(latitude, longitude).first).to be_a(DailyWeather)
    expect(WeatherFacade.five_day_weather(latitude, longitude).length).to eq(5)
  end

  it 'sends information to the Hourly Weather poro' do
    json_response = File.read('spec/fixtures/request_weather_data.json')
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=b223e219a2cff0890dbe4fae9e6d5836&exclude=minutely,alerts&lat=39.742043&lon=-104.991531&units=imperial").
    to_return(status: 200, body: json_response, headers: {})

    latitude = 39.742043
    longitude = -104.991531

    expect(WeatherFacade.next_eight_hours(latitude, longitude).first).to be_an(HourlyWeather)
    expect(WeatherFacade.next_eight_hours(latitude, longitude).length).to eq(8)
  end
end
