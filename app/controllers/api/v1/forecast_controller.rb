class Api::V1::ForecastController < ApplicationController
  def show
    location = params[:location]
    #location = "denver,co", need to convert to geocoords(lat/long)
  end
end
