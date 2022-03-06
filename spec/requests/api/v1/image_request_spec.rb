require 'rails_helper'

RSpec.describe "Background Image by city API endpoint" do
  it 'returns a single image for photo searched by keyword location' do
    json_response = File.read('spec/fixtures/city_photo_data.json')
    stub_request(:get, "https://api.unsplash.com/search/photos?client_id=LahT-YFX4dt-VSuL19jrkdwH9rvkJTgE7RAXbkBeCS0&query=denver,co").
    to_return(status: 200, body: json_response, headers: {})

    city = "denver,co"

    get "/api/v1/backgrounds?location=#{city}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    parsed_image_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_image_data).to be_a(Hash)
    expect(parsed_image_data.length).to eq(1)
    expect(parsed_image_data).to_have_key(:data)
    expect(parsed_image_data[:data]).to be_a(Hash)
    expect(parsed_image_data[:data].length).to eq(3)
    expect(parsed_image_data[:data]).to have_key(:type)
    expect(parsed_image_data[:data][:type]).to eq("image")
    expect(parsed_image_data[:data]).to have_key(:id)
    expect(parsed_image_data[:data][:id]).to eq(nil)
    expect(parsed_image_data[:data]).to have_key(:attributes)
    expect(parsed_image_data[:data][:attributes]).to be_a(Hash)
    expect(parsed_image_data[:data][:attributes]).to have_key(:image)
    expect(parsed_image_data[:data][:attributes][:image]).to be_a(Hash)
    expect(parsed_image_data[:data][:attributes][:image]).to have_key(:location)
    expect(parsed_image_data[:data][:attributes][:image][:location]).to be_a(String)
    expect(parsed_image_data[:data][:attributes][:image]).to have_key(:image_url)
    expect(parsed_image_data[:data][:attributes][:image][:image_url]).to be_a(String)
    expect(parsed_image_data[:data][:attributes][:image]).to have_key(:credit)
    expect(parsed_image_data[:data][:attributes][:image][:credit]).to be_a(Hash)
    expect(parsed_image_data[:data][:attributes][:image][:credit]).to have_key(:source)
    expect(parsed_image_data[:data][:attributes][:image][:credit][:source]).to be_a(String)
    expect(parsed_image_data[:data][:attributes][:image][:credit]).to have_key(:author)
    expect(parsed_image_data[:data][:attributes][:image][:credit][:author]).to be_a(String)
    expect(parsed_image_data[:data][:attributes][:image][:credit]).to have_key(:logo)
    expect(parsed_image_data[:data][:attributes][:image][:credit][:logo]).to be_a(String)
  end
end
