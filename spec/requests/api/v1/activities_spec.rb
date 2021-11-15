require 'rails_helper'

RSpec.describe 'activities endpoint' do
  it 'retrieves activities for a given destination' do
    get '/api/v1/activities', params: {destination: "chicago,il"}

    expect(response).to be_successful

    activities = JSON.parse(response.body, symbolize_names: true)

    expect(activities).to be_a(Hash)
    expect(activities).to have_key(:data)
    expect(activities[:data]).to have_key(:id)
    expect(activities[:data]).to have_key(:type)
    expect(activities[:data]).to have_key(:attributes)
  end

  it 'returns an error if no destination is given' do
    get '/api/v1/activities'

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end

  it 'returns an error if the location does not exist' do
    get '/api/v1/activities', params: {destination: "....."}

    expect(response).to_not be_successful
  end
end
