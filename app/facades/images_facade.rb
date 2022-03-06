class ImagesFacade
  def self.get_image_by_query(location)
    image_data = ImageService.get_photo(location)[:results][0]
    image_url =  image_data[:urls][:raw]
    author = image_data[:user][:username]
    hotlink = image_data[:links][:self]
    Image.new(location, image_url, author, hotlink)
  end
end
