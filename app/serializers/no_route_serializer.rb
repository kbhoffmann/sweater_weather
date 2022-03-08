class NoRouteSerializer
  def self.no_route_json(trip_data)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": trip_data.start_city,
          "end_city": trip_data.end_city,
          "travel_time": trip_data.travel_time,
          "weather_at_eta": {
          }
        }
      }
    }
  end
end
