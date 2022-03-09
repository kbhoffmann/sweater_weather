require 'rails_helper'

RSpec.describe Trip do
  it 'has attributes' do
      origin = "Denver, CO"
      destination = "Milwaukee, WI"

      trip_data = {
         :distance=>1047.017,
         :realTime=>54577,
         :formattedTime=>"14:59:49",
         :routeError=>{:errorCode=> -400, :message=>""}
               }

      trip = Trip.new(trip_data, origin, destination)

      expect(trip).to be_an_instance_of(Trip)
      expect(trip.start_city).to eq("Denver, CO")
      expect(trip.end_city).to eq("Milwaukee, WI")
      expect(trip.travel_time).to eq("14 hours, 59 minutes")
      expect(trip.travel_hours).to eq(15)
  end

  it 'has different attributes for an impossible trip' do
    origin = "Denver, CO"
    destination = "Zurich, Switzerland"

    trip_data = {:routeError=>{:errorCode=>2, :message=>""}}

    trip = Trip.new(trip_data, origin, destination)

    expect(trip).to be_an_instance_of(Trip)
    expect(trip.start_city).to eq("Denver, CO")
    expect(trip.end_city).to eq("Zurich, Switzerland")
    expect(trip.travel_time).to eq("Impossible")
    expect(trip.travel_hours).to eq("Impossible")
  end

  it 'can format time to human readable string' do
    origin = "Denver, CO"
    destination = "Milwaukee, WI"

    trip_data = {
       :distance=>1047.017,
       :realTime=>54577,
       :formattedTime=>"14:59:49",
       :routeError=>{:errorCode=> -400, :message=>""}
             }

    trip = Trip.new(trip_data, origin, destination)

    expect(trip.format_time(trip_data)).to eq("14 hours, 59 minutes")
  end
end
