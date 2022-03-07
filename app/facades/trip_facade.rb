class TripFacade
  def self.get_trip_route(origin, destination)
    trip_data = MapService.get_trip_route(origin, destination)
  end
end
