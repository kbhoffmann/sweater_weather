require 'rails_helper'

RSpec.describe 'Daily Weather' do
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
    expect(forecast.date).to eq(Time.at(1646506800).strftime("%Y-%m-%d"))
    expect(forecast.sunrise).to eq(Time.at(1646486829).to_s)
    expect(forecast.sunset).to eq(Time.at(1646528162).to_s)
    expect(forecast.max_temp).to eq(46.99)
    expect(forecast.min_temp).to eq(29.55)
    expect(forecast.conditions).to eq("light rain")
    expect(forecast.icon).to eq("10d")
  end
end
