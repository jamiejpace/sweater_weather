require 'rails_helper'

RSpec.describe 'activities endpoint' do
  it 'retrieves activities for a given city' do
    get '/api/v1/activities', params: {destination: "chicago,il"}

    expect(response).to be_successful

    activities = JSON.parse(response.body, symbolize_names: true)

    expect(activities).to be_a(Hash)
  end
end
