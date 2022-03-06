class ForecastSerializer

  def self.weather_json(current, five_day, eight_hour)
      {
      "data": {
        "id": nil,
        "type": "forecast",
        "attributes": {
          "current_weather": {
            "datetime": current.datetime,
            "sunrise": current.sunrise,
            "sunset": current.sunset,
            "temperature": current.temperature,
            "feels_like": current.feels_like,
            "humidity": current.humidity,
            "uvi": current.uvi,
            "visibility": current.visibility,
            "conditions": current.conditions,
            "icon": current.icon
          },

        "daily_weather":
          five_day.map do |day|
            {
              "date": day.date,
              "sunrise": day.sunrise,
              "sunset": day.sunset,
              "max_temp": day.max_temp,
              "min_temp": day.min_temp,
              "conditions": day.conditions,
              "icon": day.icon
            }
          end,

          "hourly_weather":
            eight_hour.map do |hour|
             {
              "time": hour.time,
              "temperature": hour.temperature,
              "conditions": hour.conditions,
              "icon": hour.icon
             }
           end
        }
      }
    }
  end

end
