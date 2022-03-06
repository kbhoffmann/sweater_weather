require 'rails_helper'

RSpec.describe 'Current Weather' do
  it 'has attributes' do
    current_weather_data = {
             :dt=>1646516148,
             :sunrise=>1646486829,
             :sunset=>1646528162,
             :temp=>31.1,
             :feels_like=>23.94,
             :humidity=>51,
             :uvi=>1.32,
             :clouds=>99,
             :visibility=>10000,
             :weather=>[{:id=>804, :main=>"Clouds",
             :description=>"overcast clouds", :icon=>"04d"}]
              }

    forecast = CurrentWeather.new(current_weather_data)
    expect(forecast).to be_an_instance_of(CurrentWeather)
    expect(forecast.datetime).to eq("2022-03-05 14:35:48 -0700")
    expect(forecast.sunrise).to eq("2022-03-05 06:27:09 -0700")
    expect(forecast.sunset).to eq("2022-03-05 17:56:02 -0700")
    expect(forecast.temperature).to eq(31.1)
    expect(forecast.feels_like).to eq(23.94)
    expect(forecast.humidity).to eq(51)
    expect(forecast.uvi).to eq(1.32)
    expect(forecast.visibility).to eq(10000)
    expect(forecast.conditions).to eq("overcast clouds")
    expect(forecast.icon).to eq("04d")
  end
end
