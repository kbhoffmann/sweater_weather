require 'rails_helper'

RSpec.describe Geocoordinate do
  it 'has attributes' do

      location_data = {
         :adminArea5=>"Denver",
         :adminArea5Type=>"City",
         :adminArea4=>"Denver County",
         :adminArea4Type=>"County",
         :adminArea3=>"CO",
         :adminArea3Type=>"State",
         :adminArea1=>"US",
         :adminArea1Type=>"Country",
         :latLng=>{:lat=>39.738453, :lng=>-104.984853}
          }

      coords = Geocoordinate.new(location_data)

      expect(coords).to be_an_instance_of(Geocoordinate)
      expect(coords.latitude).to eq(39.738453)
      expect(coords.longitude).to eq(-104.984853)
  end
end
