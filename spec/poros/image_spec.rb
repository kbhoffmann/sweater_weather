require 'rails_helper'

RSpec.describe Image do
  it 'has attributes' do
    location = "denver,co"
    image_url = "https://images.unsplash.com/photo-1629163330223-c183571735a1?ixid=MnwzMDczNjN8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUwQXxlbnwwfHx8fDE2NDY1OTIxNTE&ixlib=rb-1.2.1"
    author = "tayloradaugherty"
    hotlink = "https://api.unsplash.com/photos/zSm5JPgNeuc"

    image = Image.new(location, image_url, author, hotlink)

    expect(image).to be_an_instance_of(Image)
    expect(image.location).to eq("denver,co")
    expect(image.image_url).to eq("https://images.unsplash.com/photo-1629163330223-c183571735a1?ixid=MnwzMDczNjN8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUwQXxlbnwwfHx8fDE2NDY1OTIxNTE&ixlib=rb-1.2.1")
    expect(image.hotlink).to eq("https://api.unsplash.com/photos/zSm5JPgNeuc")
    expect(image.author).to eq("tayloradaugherty")
  end
end
