class WeatherFacade
  def self.current_weather(latitude, longitude)
    current_weather_info = WeatherService.get_weather_data(latitude, longitude)[:current]
    CurrentWeather.new(current_weather_info)
  end
end
