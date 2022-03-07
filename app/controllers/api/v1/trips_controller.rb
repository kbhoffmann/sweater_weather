class Api::V1::TripsController < ApplicationController
  def show
    trip_info = TripFacade.get_trip_route(params[:origin], params[:destination])
    #eta = Time.now plus trip.travel_time
    #coords = MapFacade.get_lat_long(params[:destination])
    #end_city_weather_at_eta = WeatherFacade.weather_at_eta(eta, coords)
  end
end
