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
    total_books_found = book_data[:numFound]
    five_book_objects = book_data[:docs].first(quantity.to_i).map do |book|
                  Book.new(book)
                end

    render json: BookSerializer.book_json(destination, forecast, total_books_found, five_book_objects)
  end
end
