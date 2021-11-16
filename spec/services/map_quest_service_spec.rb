require 'rails_helper'

RSpec.describe 'map quest service', :vcr do
  it 'returns data about a given location' do
    response = MapQuestService.location_data("Denver, CO")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_an(Array)
    expect(response[:results].first[:locations].first).to have_key(:latLng)
  end

  it 'returns data about a given route' do
    response = MapQuestService.route_data("Denver, CO", "Chicago, IL")
  
    expect(response).to be_a(Hash)
    expect(response).to have_key(:route)
    expect(response[:route]).to be_a(Hash)
    expect(response[:route]).to have_key(:formattedTime)
  end
end
