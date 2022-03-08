class Api::V1::TripsController < ApplicationController
  def create
    if check_api_key
      trip_data = TripFacade.get_trip_route(params[:origin], params[:destination])
      if trip_data.travel_hours != "Impossible"
        coords = MapFacade.get_lat_long(params[:destination])
        eta_weather = WeatherFacade.eta_weather(trip_data.travel_hours, coords.latitude, coords.longitude)
        render json: TripSerializer.road_trip_json(trip_data, eta_weather)
      else 
        render json: NoRouteSerializer.no_route_json(trip_data)
      end
    else
      render :json => { errors: "You Must Provide a valid API key" }, status: 401
    end
  end

  private

  def check_api_key
    if params[:api_key].length == 32
      user = User.find_by(api_key: params[:api_key])
    end
  end
end
