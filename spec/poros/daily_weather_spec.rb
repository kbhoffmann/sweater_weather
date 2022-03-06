require 'rails_helper'

RSpec.describe 'Current Weather' do
  it 'has attributes' do
    weather_data =  {
       :dt=>1646506800,
       :sunrise=>1646486829,
       :sunset=>1646528162,
       :temp=>{:min=>29.55, :max=>46.99},
       :weather=>[{:description=>"light rain", :icon=>"10d"}],
      }

    forecast = DailyWeather.new(weather_data)
    expect(forecast).to be_an_instance_of(DailyWeather)
    expect(forecast.date).to eq("2022-03-05")
    expect(forecast.sunrise).to eq("2022-03-05 06:27:09 -0700")
    expect(forecast.sunset).to eq("2022-03-05 17:56:02 -0700")
    expect(forecast.max_temp).to eq(46.99)
    expect(forecast.min_temp).to eq(29.55)
    expect(forecast.conditions).to eq("light rain")
    expect(forecast.icon).to eq("10d")
  end
end
