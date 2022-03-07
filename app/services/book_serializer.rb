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
            "temperature": forecast.temperature
          },
          "total_books_found": total_books_found,
          "books": 
        }
      }
    }
  end
end
