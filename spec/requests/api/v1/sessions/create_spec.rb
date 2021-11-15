require 'rails_helper'

RSpec.describe 'create session endpoint' do
  it 'can create a session' do
    user1 = User.create(email: "mose@gmail.com", password_digest: "$2a$04$Pn8HcMrgc8zJLQ5smogqyuMstpX5nhCEnZygPfznkmQjqV//svAIa", access_token: "123456789x")

    body = {
      "email": "mose@gmail.com",
      "password": "password"
    }

    post '/api/v1/sessions', params: body

    expect(response).to be_successful
    expect(response.status).to eq(200)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to have_key(:data)
    expect(user[:data]).to be_a(Hash)
    expect(user[:data][:type]).to eq("users")
  end

  it 'returns an error if credentials are bad' do
    body = {
      "email": "odellthedog@gmail.com",
      "password": "password"
    }

    post '/api/v1/sessions', params: body

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq("Credentials are incorrect")
  end
end
