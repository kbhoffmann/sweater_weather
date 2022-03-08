class Trip
  attr_reader :start_city, :end_city,
              :travel_time, :travel_hours
  def initialize(trip_data, origin, destination)
    @start_city = origin
    @end_city = destination
    @travel_time = Time.at(trip_data[:realTime]).utc.strftime("%H hours, %M minutes")
    @travel_hours = Time.at(trip_data[:realTime]).utc.strftime("%H").to_i
  end
end
