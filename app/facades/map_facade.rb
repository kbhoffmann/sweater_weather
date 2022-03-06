class MapFacade
  def self.get_lat_long(location)
    location_data = MapService.get_lat_long(location)[:results][0][:locations][0]
    Geocoordinate.new(location_data)
  end
end
