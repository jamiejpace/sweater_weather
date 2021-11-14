require 'rails_helper'

RSpec.describe 'map quest service', :vcr do
  it 'returns data about a given location' do
    response = MapQuestService.location_data("Denver, CO")
  
    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_an(Array)
    expect(response[:results].first[:locations].first).to have_key(:latLng)
  end
end
