require 'rails_helper'

RSpec.describe WeatherService do
  it 'gets weather data for an area by geocodes' do
    json_response = File.read('spec/fixtures/request_weather_data.json')
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=b223e219a2cff0890dbe4fae9e6d5836&exclude=minutely,alerts&lat=39.738453&lon=-104.984853&units=imperial").
    to_return(status: 200, body: json_response, headers: {})

    latitude = 39.738453
    longitude = -104.984853

    expect(WeatherService.get_weather_data(latitude, longitude)).to be_a(Hash)
    weather_data = WeatherService.get_weather_data(latitude, longitude)

    expect(weather_data).to have_key(:current)
    expect(weather_data[:current]).to be_a(Hash)
    expect(weather_data[:current]).to have_key(:dt)
    expect(weather_data[:current][:dt]).to be_an(Integer)
    expect(weather_data[:current]).to have_key(:sunrise)
    expect(weather_data[:current][:sunrise]).to be_an(Integer)
    expect(weather_data[:current]).to have_key(:sunset)
    expect(weather_data[:current][:sunset]).to be_an(Integer)

    expect(weather_data[:current]).to have_key(:temp)
    expect(weather_data[:current][:temp]).to be_a(Float)
    expect(weather_data[:current]).to have_key(:feels_like)
    expect(weather_data[:current][:feels_like]).to be_a(Float)
    expect(weather_data[:current]).to have_key(:humidity)
    expect(weather_data[:current][:humidity]).to be_an(Integer)

    expect(weather_data[:current]).to have_key(:uvi)
    expect(weather_data[:current][:uvi]).to be_a(Float)

    expect(weather_data[:current]).to have_key(:visibility)
    expect(weather_data[:current][:visibility]).to be_an(Integer)

    expect(weather_data[:current]).to have_key(:weather)
    expect(weather_data[:current][:weather]).to be_an(Array)
    expect(weather_data[:current][:weather].first).to be_a(Hash)
    expect(weather_data[:current][:weather].first).to have_key(:description)
    expect(weather_data[:current][:weather].first[:description]).to be_a(String)
    expect(weather_data[:current][:weather].first).to have_key(:icon)
    expect(weather_data[:current][:weather].first[:icon]).to be_a(String)

    expect(weather_data).to have_key(:hourly)
    expect(weather_data[:hourly]).to be_an(Array)
    expect(weather_data[:hourly][0]).to be_a(Hash)
    expect(weather_data[:hourly][0]).to have_key(:dt)
    expect(weather_data[:hourly][0][:dt]).to be_an(Integer)
    expect(weather_data[:hourly][0]).to have_key(:temp)
    expect(weather_data[:hourly][0][:temp]).to be_a(Float)
    expect(weather_data[:hourly][0]).to have_key(:weather)
    expect(weather_data[:hourly][0][:weather]).to be_an(Array)
    expect(weather_data[:hourly][0][:weather][0]).to be_a(Hash)
    expect(weather_data[:hourly][0][:weather][0]).to have_key(:description)
    expect(weather_data[:hourly][0][:weather][0][:description]).to be_a(String)
    expect(weather_data[:hourly][0][:weather][0]).to have_key(:icon)
    expect(weather_data[:hourly][0][:weather][0][:icon]).to be_a(String)

    expect(weather_data).to have_key(:daily)
    expect(weather_data[:daily]).to be_an(Array)
    expect(weather_data[:daily][0]).to be_a(Hash)
    expect(weather_data[:daily][0]).to have_key(:dt)
    expect(weather_data[:daily][0][:dt]).to be_an(Integer)
    expect(weather_data[:daily][0]).to have_key(:sunrise)
    expect(weather_data[:daily][0][:sunrise]).to be_an(Integer)
    expect(weather_data[:daily][0]).to have_key(:sunset)
    expect(weather_data[:daily][0][:sunset]).to be_an(Integer)
    expect(weather_data[:daily][0]).to have_key(:temp)
    expect(weather_data[:daily][0][:temp]).to be_a(Hash)
    expect(weather_data[:daily][0][:temp]).to have_key(:min)
    expect(weather_data[:daily][0][:temp][:min]).to be_a(Float)
    expect(weather_data[:daily][0][:temp]).to have_key(:max)
    expect(weather_data[:daily][0][:temp][:max]).to be_a(Float)

    expect(weather_data[:daily][0]).to have_key(:weather)
    expect(weather_data[:daily][0][:weather]).to be_an(Array)
    expect(weather_data[:daily][0][:weather][0]).to be_a(Hash)
    expect(weather_data[:daily][0][:weather][0]).to have_key(:description)
    expect(weather_data[:daily][0][:weather][0][:description]).to be_a(String)
    expect(weather_data[:daily][0][:weather][0]).to have_key(:icon)
    expect(weather_data[:daily][0][:weather][0][:icon]).to be_a(String)
  end
end
