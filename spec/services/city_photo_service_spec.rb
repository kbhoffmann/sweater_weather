require 'rails_helper'

RSpec.describe CityPhotoService do
  it 'gets photos of a city by city name' do
    json_response = File.read('spec/fixtures/city_photo_data.json')
    stub_request(:get, "https://api.unsplash.com/search/photos?client_id=LahT-YFX4dt-VSuL19jrkdwH9rvkJTgE7RAXbkBeCS0&query=Denver,%20CO").
    to_return(status: 200, body: json_response, headers: {})


    city = "Denver, CO"

    expect(CityPhotoService.get_city_photo(city)).to be_a(Hash)
    expect(CityPhotoService.get_city_photo(city)).to have_key(:results)
    expect(CityPhotoService.get_city_photo(city)[:results]).to be_an(Array)
    search_results = CityPhotoService.get_city_photo(city)[:results][0]
    expect(search_results).to have_key(:description)
    expect(search_results[:description]).to be_a(String)
    expect(search_results).to have_key(:alt_description)
    expect(search_results[:alt_description]).to be_a(String)
    expect(search_results).to have_key(:urls)
    expect(search_results[:urls]).to be_a(Hash)
    expect(search_results[:urls]).to have_key(:raw)
    expect(search_results[:urls]).to have_key(:full)
    expect(search_results[:urls]).to have_key(:regular)
    expect(search_results[:urls]).to have_key(:small)
    expect(search_results[:urls]).to have_key(:thumb)
    expect(search_results[:urls]).to have_key(:small_s3)
    expect(search_results).to have_key(:links)
    expect(search_results[:links]).to be_a(Hash)
  end
end
