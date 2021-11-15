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
  end
end
