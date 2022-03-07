class BookService
  def self.conn
    Faraday.new(url: 'http://openlibrary.org')
  end

  def self.book_search(book_query)
    response = conn.get("/search.json?") do |request|
      request.params['q'] = book_query
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
