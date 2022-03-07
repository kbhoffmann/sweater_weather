require 'rails_helper'

RSpec.describe "Book by city API endpoint" do
  it 'returns a json response ' do
    location = "denver,co"
    quantity = "5"

    get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

    parsed_book_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(parsed_book_data).to be_a(Hash)
    expect(parsed_book_data.length).to eq(1)
    expect(parsed_book_data).to have_key(:data)
    expect(parsed_book_data[:data]).to be_a(Hash)
    expect(parsed_book_data[:data].length).to eq(3)
    expect(parsed_book_data[:data]).to have_key(:id)
    expect(parsed_book_data[:data][:id]).to eq(nil)
    expect(parsed_book_data[:data]).to have_key(:type)
    expect(parsed_book_data[:data][:type]).to eq("books")
    expect(parsed_book_data[:data]).to have_key(:attributes)
    expect(parsed_book_data[:data][:attributes]).to be_a(Hash)

    attributes = parsed_book_data[:data][:attributes]
    expect(attributes).to have_key(:destination)
    expect(attributes[:destination]).to be_a(String)
    expect(attributes).to have_key(:forecast)
    expect(attributes[:forecast]).to be_a(Hash)
    expect(attributes[:forecast]).to have_key(:summary)
    expect(attributes[:forecast][:summary]).to be_a(String)
    expect(attributes[:forecast]).to have_key(:temperature)
    expect(attributes[:forecast][:temperature]).to be_a(String)
    expect(attributes).to have_key(:total_books_found)
    expect(attributes[:total_books_found]).to be_an(Integer)
    expect(attributes).to have_key(:books)
    expect(attributes[:books]).to be_an(Array)

    books = attributes[:books]
    expect(books).to be_an(Array)

    books.each do |book|
      expect(book).to have_key(:isbn)
      expect(book[:isbn]).to be_an(Array)
      expect(book[:isbn][0]).to be_an(String)
      expect(book[:isbn][1]).to be_an(String)
      expect(book).to have_key(:title)
      expect(book[:title]).to be_an(String)
      expect(book).to have_key(:publisher)
      expect(book[:publisher]).to be_an(Array)
      expect(book[:publisher][0]).to be_a(String)
    end
  end
end
