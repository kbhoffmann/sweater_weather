require 'rails_helper'

RSpec.describe DestinationWeather do
  it 'has attributes' do
    eta_weather_data =
        {
          :dt=>1646751600,
          :temp=>28.09,
          :weather=>[{:description=>"clear sky"}]
        }

    eta_weather = DestinationWeather.new(eta_weather_data)
    expect(eta_weather).to be_an_instance_of(DestinationWeather)
    expect(eta_weather.temperature).to eq(28.09)
    expect(eta_weather.conditions).to eq("clear sky")
  end
end
