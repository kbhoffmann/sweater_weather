require 'rails_helper'

RSpec.describe Book do
  it 'has attributes' do

    expect(book).to be_an_instance_of(Book)
  end
end
