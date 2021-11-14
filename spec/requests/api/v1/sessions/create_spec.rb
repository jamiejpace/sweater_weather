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
    expect(response.status).to eq(201)
  end
end
