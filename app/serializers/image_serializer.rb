class ImageSerializer
  def self.image_json(image)
    {
  "data": {
    "id": nil,
    "type": "image",
    "attributes": {
      "image": {
        "location": image.location,
        "image_url": image.image_url,
        "credit": {
            "hotlink": image.hotlink,
            "author": image.author ,
        }
      }
    }
  }
}
  end
end
