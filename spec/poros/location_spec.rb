require 'rails_helper'

RSpec.describe Location do
  it 'exists and has attributes' do
    location = Location.new({lat: 39.738453, lng: -104.984853})

    expect(location).to be_a(Location)
    expect(location.latitude).to eq(39.738453)
    expect(location.longitude).to eq(-104.984853)
  end
end
