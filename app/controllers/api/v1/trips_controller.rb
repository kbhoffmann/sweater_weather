class Api::V1::TripsController < ApplicationController
  def show
    trip_info = TripFacade.get_trip_route(params[:origin], params[:destination])
    coords = MapFacade.get_lat_long(params[:destination])
    # coords.latitude coords.longitude
    #eta = Time.now plus trip.travel_time
    #end_city_weather_at_eta = WeatherFacade.eta_weather(trip_travel_time, lat, long)
    #render json: TripSerializer.roadtrip_json()
  end
end
