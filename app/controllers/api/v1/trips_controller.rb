class Api::V1::TripsController < ApplicationController
  def show
    trip_data = TripFacade.get_trip_route(params[:origin], params[:destination])
    coords = MapFacade.get_lat_long(params[:destination])
    trip_travel_time = trip_data.travel_hours
    # coords.latitude coords.longitude
    #eta = Time.now plus trip.travel_time
    #eta_weather = WeatherFacade.eta_weather(trip_travel_time, lat, long)
    render json: TripSerializer.road_trip_json(trip_data, eta_weather)
  end
end
