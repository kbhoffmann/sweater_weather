class Image
  attr_reader :location, :image_url, :hotlink, :author

  def initialize(location, image_url, author, hotlink)
    @location = location
    @image_url = image_url
    @hotlink = hotlink
    @author = author
  end
end
