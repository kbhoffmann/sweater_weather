require 'rails_helper'

RSpec.describe TripFacade do
  it 'sends trip data to the Trip poro' do
    json_response = File.read('spec/fixtures/trip_route_data.json')
    stub_request(:get, "http://www.mapquestapi.com/directions/v2/route?from=Denver,%20CO&key=UHerve0fkvZVNWgBwQzNhk9nhiz3gtWX&to=Milwaukee,%20WI").
    to_return(status: 200, body: json_response, headers: {})

    origin = "Denver, CO"
    destination = "Milwaukee, WI"

    expect(TripFacade.get_trip_route(origin, destination)).to be_a(Trip)
    trip = TripFacade.get_trip_route(origin, destination)
    expect(trip.start_city).to be_a(String)
    expect(trip.start_city).to eq("Denver, CO")
    expect(trip.end_city).to be_a(String)
    expect(trip.end_city).to eq("Milwaukee, WI")
    expect(trip.travel_time).to be_a(String)
  end

  it 'sends trip data for an impossible trip to the Trip poro' do
    swiss_trip_json_response = File.read('spec/fixtures/swiss_trip_data.json')
    stub_request(:get, "http://www.mapquestapi.com/directions/v2/route?from=Denver,%20CO&key=UHerve0fkvZVNWgBwQzNhk9nhiz3gtWX&to=Zurich,%20Switzerland").
    to_return(status: 200, body: swiss_trip_json_response, headers: {})

    origin = "Denver, CO"
    destination = "Zurich, Switzerland"

    expect(TripFacade.get_trip_route(origin, destination)).to be_a(Trip)
  end
end
