require 'rails_helper'

RSpec.describe 'roadtrip endpoint', :vcr do
  it 'retrieves data about a roadtrip between two places' do
    user1 = User.create(email: "mose25@gmail.com", password_digest: "abc123", access_token: "jgn983hy48thw9begh98h4539h4")
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }

    post '/api/v1/road_trip', params: body

    expect(response).to be_successful
  end
end
