class WeatherFacade
  def self.current_weather(latitude, longitude)
    current_weather_info = WeatherService.get_weather_data(latitude, longitude)[:current]
    CurrentWeather.new(current_weather_info)
  end

  def self.five_day_weather(latitude, longitude)
    five_days_data = WeatherService.get_weather_data(latitude, longitude)[:daily].first(5)
    five_days_data.map do |day_data|
      DailyWeather.new(day_data)
    end
  end
end
