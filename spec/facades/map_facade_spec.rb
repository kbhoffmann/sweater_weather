require 'rails_helper'

RSpec.describe MapFacade do
  xit 'can send data to the map poro' do
    json_response = File.read('spec/fixtures/map_geocoding_data.json')
    stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=UHerve0fkvZVNWgBwQzNhk9nhiz3gtWX&location=Denver,CO").
    to_return(status: 200, body: json_response, headers: {})

    location = "Denver,CO"

    expect(MapFacade.get_lat_long(location).first).to be_a(Location)
  end
end
