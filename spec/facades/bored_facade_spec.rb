require 'rails_helper'

RSpec.describe 'bored facade', :vcr do
  it 'returns a two activity objects in an array for temp < 50' do
    response = BoredFacade.get_two_activities(33)
    expect(response).to be_an(Array)
    expect(response.count).to eq(2)
    expect(response.first).to be_an(Activity)
    expect(response.first.type).to eq("cooking")
    expect(response.last).to be_an(Activity)
  end

  it 'returns a two activity objects in an array for temp > 50 and temp < 60' do
    response = BoredFacade.get_two_activities(55)

    expect(response).to be_an(Array)
    expect(response.count).to eq(2)
    expect(response.first).to be_an(Activity)
    expect(response.first.type).to eq("busywork")
    expect(response.last).to be_an(Activity)
  end

  it 'returns a two activity objects in an array for temp > 60' do
    response = BoredFacade.get_two_activities(70)

    expect(response).to be_an(Array)
    expect(response.count).to eq(2)
    expect(response.first).to be_an(Activity)
    expect(response.first.type).to eq("recreational")
    expect(response.last).to be_an(Activity)
  end
end
