class ImagesFacade
  def self.get_image_by_query(query)
    image_data = ImageService.get_photo(query)
    Image.new(image_data)
  end
end
