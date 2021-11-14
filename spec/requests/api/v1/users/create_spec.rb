require 'rails_helper'

RSpec.describe 'create user endpoint' do
  it 'can create a user' do
    body = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', params: body
  
    expect(response).to be_successful
    expect(response.status).to eq(201)
  end

  it 'it returns an error if email address already exists for a user' do
    user1= User.create(email: "mose@gmail.com", password_digest: "abc123", access_token: "123456789x")

    body = {
      "email": "mose@gmail.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', params: body

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq("Email has already been taken")
  end

  it 'it returns an error if passwords do not match' do
    body = {
      "email": "mose@gmail.com",
      "password": "password1",
      "password_confirmation": "password"
    }

    post '/api/v1/users', params: body

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq("Passwords don't match")
  end

  it 'it returns an error if a field is missing' do
    body = {
      "email": "mose@gmail.com",
      "password": "password1",
    }

    post '/api/v1/users', params: body

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq("Missing a field")
  end
end
