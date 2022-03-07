class Api::V1::BooksController < ApplicationController
  def index
    book_query = params[:location]
    quantity = params[:quantity]

    book_conn = Faraday.new(url: 'http://openlibrary.org')

    book_api_response = book_conn.get("/search.json?") do |request|
      request.params['q'] = book_query
    end

    book_data = JSON.parse(book_api_response.body, symbolize_names: true)
    binding.pry
    #need to limit
    Book.new(book_data)

  end
end
