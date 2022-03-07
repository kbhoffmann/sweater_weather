class Api::V1::TripsController < ApplicationController
  def show
    # end_city_weather_at_eta = WeatherFacade.weather_on_day
    trip_info = TripFacade.get_trip_route(params[:origin], params[:destination])
  end
end
