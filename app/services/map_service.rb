class MapService
  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com")
  end

  def self.get_lat_long(location)
    response = conn.get("/geocoding/v1/address?") do |request|
      request.params['key'] = "#{ENV['mapquest_api_key']}"
      request.params['location'] = location
    end

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_trip_route(origin, destination)
    response = conn.get("/directions/v2/route?") do |request|
      request.params['key'] = "#{ENV['mapquest_api_key']}"
      request.params['from'] = origin
      request.params['to'] = destination
    end

    data = JSON.parse(response.body, symbolize_names: true)
  end
end
