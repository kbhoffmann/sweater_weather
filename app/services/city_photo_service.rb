class CityPhotoService
  def self.conn
    Faraday.new(url: "https://api.unsplash.com")
  end

  def self.get_city_photo(city)
    response = conn.get("/search/photos?") do |request|
      request.params['client_id'] = "#{ENV['unsplash_client_id']}"
      request.params['query'] = city
    end

    data = JSON.parse(response.body, symbolize_names: true)
  end
end
