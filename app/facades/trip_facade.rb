class TripFacade
  def self.get_trip_route(origin, destination)
    trip_data = MapService.get_trip_route(origin, destination)[:route]
    binding.pry

    Trip.new(trip_data, origin, destination)
  end
end
