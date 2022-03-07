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
    current_weather = WeatherFacade.current_weather(coords.latitude, coords.longitude)
    destination = params[:location]
    summary = current_weather.conditions
    temperature = current_weather.temperature
    total_books_found = book_data[:numFound]
    five_books = book_data[:docs].first(quantity.to_i)
    five_books.map do |book|
      binding.pry
      Book.new(book)
    end
    # Book.new(book_data)
  end
end
