class WeatherService
  def self.conn
    Faraday.new(url: "https://api.openweathermap.org")
  end

  def self.get_weather_data(latitude, longitude)
    response = conn.get("/data/2.5/onecall?") do |request|
      request.params['lat'] = latitude
      request.params['lon'] = longitude
      request.params['appid'] = "#{ENV['weather_api_key']}"
      request.params['units'] = 'imperial'
      request.params['exclude'] = "minutely,alerts"
    end

    data = JSON.parse(response.body, symbolize_names: true)
  end
end
