require 'rails_helper'

RSpec.describe 'roadtrip endpoint', :vcr do
  it 'retrieves data about a roadtrip between two places' do
    user1 = User.create(email: "mose25@gmail.com", password_digest: "abc123")
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": user1.access_token
    }

    post '/api/v1/road_trip', params: body

    expect(response).to be_successful
    expect(response.status).to eq(200)

    roadtrip = JSON.parse(response.body, symbolize_names: true)

    expect(roadtrip).to be_a(Hash)
    expect(roadtrip).to have_key(:data)
    expect(roadtrip[:data]).to have_key(:id)
    expect(roadtrip[:data]).to have_key(:type)
    expect(roadtrip[:data]).to have_key(:attributes)
  end

  it 'returns a travel time of impossible if no route exists' do
    user1 = User.create(email: "mose25@gmail.com", password_digest: "abc123")
    body = {
      "origin": "Denver,CO",
      "destination": "London, England",
      "api_key": user1.access_token
    }

    post '/api/v1/road_trip', params: body

    expect(response).to be_successful

    roadtrip = JSON.parse(response.body, symbolize_names: true)

    expect(roadtrip).to be_a(Hash)
    expect(roadtrip).to have_key(:data)
    expect(roadtrip[:data]).to have_key(:attributes)
    expect(roadtrip[:data][:attributes][:travel_time]).to eq("impossible route")
  end

  it 'returns an error if missing a destination or origin' do
    user1 = User.create(email: "mose25@gmail.com", password_digest: "abc123")
    body = {
      "destination": "London, England",
      "api_key": user1.access_token
    }

    post '/api/v1/road_trip', params: body

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end
