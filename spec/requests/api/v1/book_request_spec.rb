require 'rails_helper'

RSpec.describe "Book by city API endpoint" do
  it 'returns a json response ' do
    location = "denver,co"
    quantity = "5"

    get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

    parsed_book_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    books.each do |book|
      expect(book).to be_a(Hash)
      expect(book.length).to eq(1)
      expect(book).to have_key(:data)
      expect(book[:data]).to be_a(Hash)
      expect(book[:data].length).to eq(3)
      expect(book[:data]).to have_key(:id)
      expect(book[:data][:id]).to eq(nil)
      expect(book[:data]).to have_key(:type)
      expect(book[:data][:type]).to eq("books")
      expect(book[:data]).to have_key(:attributes)
      expect(book[:data][:attributes]).to be_a(Hash)
      # expect(book[:data][:attributes].length).to eq(3)
      expect(book[:data][:attributes]).to have_key(:destination)
      expect(book[:data][:attributes][:destination]).to be_a(String)
      expect(book[:data][:attributes]).to have_key(:forecast)
      expect(book[:data][:attributes][:forecast]).to be_a(Hash)
      expect(book[:data][:attributes][:forecast]).to have_key(:summary)
      expect(book[:data][:attributes][:summary]).to be_an(String)
      expect(book[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(book[:data][:attributes][:temperature]).to be_an(String)
      expect(book[:data][:attributes]).to have_key(:total_books_found)
      expect(book[:data][:attributes][:total_books_found]).to be_an(Integer)
      expect(book[:data][:attributes]).to have_key(:books)
      expect(book[:data][:attributes][:books]).to be_an(Array)
      expect(book[:data][:attributes][:books][0]).to have_key(:title)
      expect(book[:data][:attributes][:title][:books]).to be_an(String)
      expect(book[:data][:attributes][:books][0]).to have_key(:publisher)
      expect(book[:data][:attributes][:books][0][:publisher]).to be_an(Array)
      expect(book[:data][:attributes][:books][0][:publisher][0]).to be_a(String)
      expect(book[:data][:attributes][:books][0]).to have_key(:isbn)
      expect(book[:data][:attributes][:books][0][:isbn]).to be_an(Array)
      expect(book[:data][:attributes][:books][0][:isbn][0]).to be_an(String)
      expect(book[:data][:attributes][:books][0][:isbn][1]).to be_an(String)
      expect(book[:data][:attributes]).to have_key(:title)
      expect(book[:data][:attributes][:title]).to be_a(String)
      expect(book[:data][:attributes]).to have_key(:publisher)
      expect(book[:data][:attributes][:publisher]).to be_an(Array)
    end
  end
end
