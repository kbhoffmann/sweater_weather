require 'rails_helper'

RSpec.describe MapService do
  it 'gets the latitude and longitude for a city' do
    json_response = File.read('spec/fixtures/map_geocoding_data.json')
    stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=UHerve0fkvZVNWgBwQzNhk9nhiz3gtWX&location=denver,co").
    to_return(status: 200, body: json_response, headers: {})

    location = "denver,co"

    expect(MapService.get_lat_long(location)).to be_a(Hash)
    expect(MapService.get_lat_long(location)).to have_key(:results)
    expect(MapService.get_lat_long(location)[:results]).to be_an(Array)
    results_data = MapService.get_lat_long(location)[:results][0]
    expect(results_data).to be_a(Hash)
    expect(results_data).to have_key(:locations)
    expect(results_data[:locations]).to be_an(Array)
    expect(results_data[:locations][0]).to have_key(:latLng)
    expect(results_data[:locations][0][:latLng]).to be_a(Hash)
    expect(results_data[:locations][0][:latLng]).to have_key(:lat)
    expect(results_data[:locations][0][:latLng][:lat]).to be_a(Float)
    expect(results_data[:locations][0][:latLng]).to have_key(:lng)
    expect(results_data[:locations][0][:latLng][:lng]).to be_a(Float)
  end

  it 'gets the route between two cities' do
    json_response = File.read('spec/fixtures/trip_route_data.json')
    stub_request(:get, "http://www.mapquestapi.com/directions/v2/route?from=Denver,%20CO&key=UHerve0fkvZVNWgBwQzNhk9nhiz3gtWX&to=Milwaukee,%20WI").
    to_return(status: 200, body: json_response, headers: {})

    origin = "Denver, CO"
    destination = "Milwaukee, WI"

    expect(MapService.get_trip_route(origin, destination)).to be_a(Hash)
    expect(MapService.get_trip_route(origin, destination)).to have_key(:route)
    expect(MapService.get_trip_route(origin, destination)[:route]).to be_a(Hash)
    expect(MapService.get_trip_route(origin, destination)[:route]).to have_key(:distance)
    expect(MapService.get_trip_route(origin, destination)[:route][:distance]).to be_a(Float)
    expect(MapService.get_trip_route(origin, destination)[:route]).to have_key(:realTime)
    expect(MapService.get_trip_route(origin, destination)[:route][:realTime]).to be_an(Integer)
  end
end
