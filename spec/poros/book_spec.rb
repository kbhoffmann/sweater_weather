require 'rails_helper'

RSpec.describe Book do
  it 'has attributes' do
    book_data =  {
             :isbn=>["9780762507849", "0762507845"],
             :title=>"Denver, Co",
             :publisher=>["Universal Map Enterprises"]
           }

    book = Book.new(book_data)

    expect(book).to be_an_instance_of(Book)
    expect(book.isbn).to eq(["9780762507849", "0762507845"])
    expect(book.title).to eq("Denver, Co")
    expect(book.publisher).to eq(["Universal Map Enterprises"])
  end
end
