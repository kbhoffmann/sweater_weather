class BookSerializer
  def self.book_json(destination, forecast, total_books_found, five_book_objects)
    {
      "data": {
        "id": nil,
        "type": "books",
        "attributes": {
          "destination": destination,
          "forecast": {
            "summary": forecast.conditions,
            "temperature": forecast.temperature.round.to_s.concat(" F")
          },
          "total_books_found": total_books_found,
          "books":
          five_book_objects.map do |book|
            {
              "isbn": book.isbn,
              "title": book.title,
              "publisher": book.publisher
            }
          end
        }
      }
    }
  end
end
