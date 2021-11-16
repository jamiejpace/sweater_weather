require 'rails_helper'

RSpec.describe 'map quest facade', :vcr do
  it 'returns a map object' do
    response = MapQuestFacade.get_location("Denver, CO")

    expect(response).to be_a(Location)
    expect(response.latitude).to be_a(Float)
    expect(response.longitude).to be_a(Float)
  end

  it 'returns a route time' do
    response = MapQuestFacade.get_route_data("Denver, CO", "Chicago, IL")

    expect(response).to be_a(String)
  end
end
