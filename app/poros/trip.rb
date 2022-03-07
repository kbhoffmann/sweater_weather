class Trip
  attr_reader :start_city, :end_city,
              :travel_time
  def initialize(trip_data, origin, destination)
    @start_city = origin
    @end_city = destination
    @travel_time = Time.at(trip_data[:realTime]).utc.strftime("%H hours, %M minutes")
  end
end
