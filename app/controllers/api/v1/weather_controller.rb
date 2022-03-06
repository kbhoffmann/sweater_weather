class Api::V1::WeatherController < ApplicationController
  def show
    coords = MapFacade.get_lat_long(params[:location])
    current = WeatherFacade.current_weather(coords.latitude, coords.longitude)
    five_day = WeatherFacade.five_day_weather(coords.latitude, coords.longitude)
    eight_hour = WeatherFacade.next_eight_hours(coords.latitude, coords.longitude)
    render json: ForecastSerializer.weather_json(current, five_day, eight_hour)
  end
end
