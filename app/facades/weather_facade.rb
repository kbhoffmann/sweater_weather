class WeatherFacade
  def self.current_weather(latitude, longitude)
    current_weather_info = WeatherService.get_weather(latitude, longitude)[:current]
    Forecast.new(current_weather_info)
  end
end
