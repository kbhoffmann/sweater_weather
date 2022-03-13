class WeatherFacade
  def self.get_weather(latitude, longitude)
    WeatherService.get_weather_data(latitude, longitude)
  end

  def self.current_weather(latitude, longitude)
    current_weather_data = get_weather(latitude, longitude)[:current]
    CurrentWeather.new(current_weather_data)
  end

  def self.daily_weather(latitude, longitude)
    days_weather_data = get_weather(latitude, longitude)[:daily].first(5)
    days_weather_data.map do |day_data|
      DailyWeather.new(day_data)
    end
  end

  def self.hourly_weather(latitude, longitude)
      hours_weather_data = get_weather(latitude, longitude)[:hourly].first(8)
      hours_weather_data.map do |hour_data|
      HourlyWeather.new(hour_data)
    end
  end

  def self.eta_weather(travel_time, latitude, longitude)
    eta_hour_data = get_weather(latitude, longitude)[:hourly].first(travel_time).last
    DestinationWeather.new(eta_hour_data)
  end
end
