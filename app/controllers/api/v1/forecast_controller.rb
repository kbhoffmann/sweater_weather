class Api::V1::ForecastController < ApplicationController
  def show
    coords = MapFacade.get_lat_long(params[:location])
    lat = coords.latitude     #=> 39.738453
    lon = coords.longitude     #=> -104.984853
    current_weather = WeatherFacade.current_weather(lat,lon)
    daily_weather = WeatherFacade.five_day_weather(lat,lon)
    hourly_weather = WeatherFacade.next_eight_hours(lat,lon)
  end
end
