require 'rails_helper'

RSpec.describe ImagesFacade do
  it 'sends image data to the Image poro' do
    json_response = File.read('spec/fixtures/city_photo_data.json')
    stub_request(:get, "https://api.unsplash.com/search/photos?client_id=LahT-YFX4dt-VSuL19jrkdwH9rvkJTgE7RAXbkBeCS0&query=denver,co").
    to_return(status: 200, body: json_response, headers: {})

    query = "denver,co"

    expect(ImagesFacade.get_image_by_query(query)).to be_an(Image)
    image = ImagesFacade.get_image_by_query(query)
    expect(image.image_url).to be_a(String)
    expect(image.location).to eq("denver,co")
    expect(image.author).to be_a(String)
    expect(image.hotlink).to be_a(String)
  end
end
