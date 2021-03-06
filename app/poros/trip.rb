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
    if trip_data[:routeError][:errorCode] == 2
      @travel_time = "Impossible"
      @travel_hours = "Impossible"
    else
      @travel_time = format_time(trip_data)
      @travel_hours = trip_data[:realTime] / 3600
    end
  end

  def format_time(trip_data)
    hours = trip_data[:formattedTime][0] + trip_data[:formattedTime][1]
    minutes = trip_data[:formattedTime][3] + trip_data[:formattedTime][4]
    "#{hours} hours, #{minutes} minutes"
  end
end
