class Api::V1::WeatherController < ApplicationController
  def show
    coords = MapFacade.get_lat_long(params[:location])
    weather_data = WeatherFacade.get_weather(coords.latitude, coords.longitude)
    render json: ForecastSerializer.weather_json(weather_data)
  end
end
