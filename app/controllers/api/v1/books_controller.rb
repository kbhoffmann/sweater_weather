class Api::V1::BooksController < ApplicationController
  def index
    quantity = params[:quantity]

    coords = MapFacade.get_lat_long(params[:location])

    forecast = WeatherFacade.current_weather(coords.latitude, coords.longitude)

    destination = params[:location]

    book_data = BookService.book_search(params[:location])

    total_books_found = book_data[:numFound]
    five_book_objects = book_data[:docs].first(quantity.to_i).map do |book|
                  Book.new(book)
                end

    render json: BookSerializer.book_json(destination, forecast, total_books_found, five_book_objects)
  end
end
