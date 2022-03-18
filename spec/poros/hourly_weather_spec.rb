require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'has attributes' do
    weather_data = {
                 :dt=>1646514000,
                 :temp=>32.56,
                 :weather=>[{:description=>"overcast clouds", :icon=>"04d"}],
                 }

    forecast = HourlyWeather.new(weather_data)
    expect(forecast).to be_an_instance_of(HourlyWeather)
    # expect(forecast.time).to eq("14:00:00")
    expect(forecast.time).to eq(Time.at(1646514000).strftime("%H:%M:%S"))
    expect(forecast.temperature).to eq(32.56)
    expect(forecast.conditions).to eq("overcast clouds")
    expect(forecast.icon).to eq("04d")
  end
end
