class Trip
  attr_reader :start_city, :end_city,
              :travel_time, :travel_hours
  def initialize(trip_data, origin, destination)
    @start_city = origin
    @end_city = destination
    @travel_time = route_available(trip_data)
    @travel_hours = route_available(trip_data)
  end

  def route_available(trip_data)
    if trip_data.has_key?(:routeError)
      @travel_time = "Impossible"
      @travel_hours = "Impossible"
    else
      @travel_time = Time.at(trip_data[:realTime]).utc.strftime("%H hours, %M minutes")
      @travel_hours = Time.at(trip_data[:realTime]).utc.strftime("%H").to_i
    end
  end
end
