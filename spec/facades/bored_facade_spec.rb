require 'rails_helper'

RSpec.describe 'bored facade', :vcr do
  it 'returns a two activity objects in an array' do
    response = BoredFacade.get_two_activities(33)

    expect(response).to be_an(Array)
    expect(response.count).to eq(2)
    expect(response.first).to be_an(Activity)
    expect(response.last).to be_an(Activity)
  end
end
