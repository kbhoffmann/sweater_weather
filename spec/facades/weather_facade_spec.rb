require 'rails_helper'

RSpec.describe WeatherFacade do
  json_response = File.read('spec/fixtures/weather_data.json')
  stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=b223e219a2cff0890dbe4fae9e6d5836&exclude=minutely,alerts&lat=39.742043&lon=-104.991531&units=imperial").
  to_return(status: 200, body: json_response, headers: {})

  it 'sends information to the current weather facade' do
    latitude = 39.742043
    longitude = -104.991531

    expect(WeatherFacade.current_weather(latitude, longitude)).be_a(Forecast)
  end
end
