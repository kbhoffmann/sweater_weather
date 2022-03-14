class WeatherFacade
  def self.get_weather(latitude, longitude)
   weather_data = WeatherService.get_weather_data(latitude, longitude)

   weather_hash = Hash.new
   weather_hash[:current_weather] = current_weather(weather_data)
   weather_hash[:daily_weather] = daily_weather(weather_data)
   weather_hash[:hourly_weather] = hourly_weather(weather_data)
   weather_hash
  end

  def self.current_weather(weather_data)
    current_weather = (weather_data)[:current]
    CurrentWeather.new(current_weather)
  end

  def self.daily_weather(weather_data)
    days_data = (weather_data)[:daily].first(5)
    days_data.map do |day_data|
      DailyWeather.new(day_data)
    end
  end

  def self.hourly_weather(weather_data)
      hours_data = (weather_data)[:hourly].first(8)
      hours_data.map do |hour_data|
      HourlyWeather.new(hour_data)
    end
  end

  def self.eta_weather(travel_time, latitude, longitude)
    eta_hour_data = WeatherService.get_weather_data(latitude, longitude)[:hourly].first(travel_time).last
    DestinationWeather.new(eta_hour_data)
  end
end
