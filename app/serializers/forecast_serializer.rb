class ForecastSerializer

  def self.weather_json(current, five_day, eight_hour)
      {
      "data": {
        "id": null,
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
            "visibility": current.visitibility,
            "conditions": current.conditions,
            "icon": current.icon
          },

          "daily_weather": [
            {
              "date": five_day.date,
              "sunrise": five_day.sunrise,
              "sunset": five_day.sunset,
              "max_temp": five_day.max_temp,
              "min_temp": five_day.min_temp,
              "conditions": five_day.conditions,
              "icon": five_day.icon
            }
          ],

          "hourly_weather": [
            {
              "time": eight_hour.time,
              "temperature": eight_hour.temperature,
              "conditions": eight_hour.conditions,
              "icon": eight.icon
            }
          ]
        }
      }
    }
  end

end
