class Api::V1::BooksController < ApplicationController
  def index
    book_query = params[:location]
    quantity = params[:quantity]

    book_conn = Faraday.new(url: 'http://openlibrary.org')

    book_api_response = book_conn.get("/search.json?") do |request|
      request.params['q'] = book_query
    end

    book_data = JSON.parse(book_api_response.body, symbolize_names: true)

    coords = MapFacade.get_lat_long(params[:location])

    forecast = WeatherFacade.current_weather(coords.latitude, coords.longitude)
    destination = params[:location]
    # summary = current_weather.conditions
    # temperature = current_weather.temperature
    total_books_found = book_data[:numFound]
    five_books_data = book_data[:docs].first(quantity.to_i)
    five_book_objects = five_books_data.map do |book|
                  Book.new(book)
                end
    end

    render json: BookSerializer.book_json(destination, forecast, total_books_found, five_book_objects)
end
