require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'gets data from the weather service' do
    json_response = File.read('spec/fixtures/request_weather_data.json')
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=b223e219a2cff0890dbe4fae9e6d5836&exclude=minutely,alerts&lat=39.738453&lon=-104.984853&units=imperial").
    to_return(status: 200, body: json_response, headers: {})

    latitude = 39.738453
    longitude = -104.984853

    expect(WeatherFacade.get_weather(latitude, longitude)).to be_a(Hash)
  end

  it 'sends information to the Current Weather poro' do
    json_response = File.read('spec/fixtures/request_weather_data.json')
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=b223e219a2cff0890dbe4fae9e6d5836&exclude=minutely,alerts&lat=39.738453&lon=-104.984853&units=imperial").
    to_return(status: 200, body: json_response, headers: {})

    weather_data = JSON.parse(json_response, symbolize_names: true)

    expect(WeatherFacade.current_weather(weather_data)).to be_a(CurrentWeather)
  end

  it 'sends information to the Daily Weather poro' do
    json_response = File.read('spec/fixtures/request_weather_data.json')
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=b223e219a2cff0890dbe4fae9e6d5836&exclude=minutely,alerts&lat=39.742043&lon=-104.991531&units=imperial").
    to_return(status: 200, body: json_response, headers: {})

    weather_data = JSON.parse(json_response, symbolize_names: true)

    expect(WeatherFacade.daily_weather(weather_data).first).to be_a(DailyWeather)
    expect(WeatherFacade.daily_weather(weather_data).length).to eq(5)
  end

  it 'sends information to the Hourly Weather poro' do
    json_response = File.read('spec/fixtures/request_weather_data.json')
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=b223e219a2cff0890dbe4fae9e6d5836&exclude=minutely,alerts&lat=39.742043&lon=-104.991531&units=imperial").
    to_return(status: 200, body: json_response, headers: {})

    weather_data = JSON.parse(json_response, symbolize_names: true)

    expect(WeatherFacade.hourly_weather(weather_data).first).to be_an(HourlyWeather)
    expect(WeatherFacade.hourly_weather(weather_data).length).to eq(8)
  end

  it 'sends information to the Hourly Weather poro for trip eta' do
    json_response = File.read('spec/fixtures/eta_weather_data.json')
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=b223e219a2cff0890dbe4fae9e6d5836&exclude=minutely,alerts&lat=-87.909421&lon=15&units=imperial").
    to_return(status: 200, body: json_response, headers: {})

    latitude = 43.041072
    longitude = -87.909421
    travel_time = 15

    expect(WeatherFacade.eta_weather(latitude, longitude, travel_time)).to be_a(DestinationWeather)
  end
end
