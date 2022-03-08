class Api::V1::TripsController < ApplicationController
  def show
    trip_data = TripFacade.get_trip_route(params[:origin], params[:destination])
    coords = MapFacade.get_lat_long(params[:destination])
    travel_time = trip_data.travel_hours
    eta_weather = WeatherFacade.eta_weather(travel_time, coords.latitude, coords.longitude)
    render json: TripSerializer.road_trip_json(trip_data, eta_weather)
  end
end
