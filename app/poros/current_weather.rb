class CurrentWeather
  attr_reader  :datetime, :sunrise, :sunset, :temperature,
               :temperature, :feels_like, :humidity, :uvi,
               :visibility, :conditions, :icon

  def initialize(current_weather_data)
    @datetime = Time.at(current_weather_data[:dt]).to_s
    @sunrise = Time.at(current_weather_data[:sunrise]).to_s
    @sunset = Time.at(current_weather_data[:sunset]).to_s
    @temperature = current_weather_data[:temp]
    @feels_like = current_weather_data[:feels_like]
    @humidity = current_weather_data[:humidity]
    @uvi = current_weather_data[:uvi]
    @visibility = current_weather_data[:visibility]
    @conditions = current_weather_data[:weather][0][:description]
    @icon = current_weather_data[:weather][0][:icon]
  end
end
