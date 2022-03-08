class TripSerializer
  def self.road_trip_json(trip_data, eta_weather)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": trip_data.start_city,
          "end_city": trip_data.end_city,
          "travel_time": trip_data.travel_time,
          "weather_at_eta": {
            "temperature": eta_weather.temperature,
            "conditions": eta_weather.conditions
          }
        }
      }
    }
  end
end
