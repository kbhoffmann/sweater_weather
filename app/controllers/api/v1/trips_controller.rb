class Api::V1::TripsController < ApplicationController
  def show
    if params[:api_key].length == 32
      trip_data = TripFacade.get_trip_route(params[:origin], params[:destination])
      coords = MapFacade.get_lat_long(params[:destination])
      eta_weather = WeatherFacade.eta_weather(trip_data.travel_hours, coords.latitude, coords.longitude)
      render json: TripSerializer.road_trip_json(trip_data, eta_weather)
    else
      render :json => { errors: "You Must Provide a valid API key" }, status: 401
    end
  end
end
