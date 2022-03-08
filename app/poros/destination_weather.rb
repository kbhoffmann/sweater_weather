class DestinationWeather
  attr_reader :temperature, :conditions
  def initialize(eta_weather_data)
    @temperature = eta_weather_data[:temp]
    @conditions = eta_weather_data[:weather][0][:description]
  end
end
