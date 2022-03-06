class Geocoordinate
  attr_reader :latitude, :longitude
  def initialize(location_data)
    @latitude = location_data[:latLng][:lat]
    @longitude = location_data[:latLng][:lng]
  end
end
