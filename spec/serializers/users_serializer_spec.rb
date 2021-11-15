require 'rails_helper'

RSpec.describe 'user serializer' do
  it 'serializes user objects into json' do
    user = User.create!(email: "odiethedog@yahoo.com", password_digest: "1kj2b30", access_token: "2309jjjdkei3")
    user_json = JSON.parse(UserSerializer.new(user).to_json, symbolize_names: true)

    expect(user_json).to be_a(Hash)
    expect(user_json).to have_key(:data)
    expect(user_json[:data]).to be_a(Hash)
    expect(user_json[:data]).to have_key(:type)
    expect(user_json[:data][:type]).to be_a(String)
    expect(user_json[:data]).to have_key(:id)
    expect(user_json[:data][:id]).to be_a(String)
    expect(user_json[:data]).to have_key(:attributes)
    expect(user_json[:data][:attributes]).to be_a(Hash)
    expect(user_json[:data][:attributes]).to have_key(:email)
    expect(user_json[:data][:attributes][:email]).to be_a(String)
    expect(user_json[:data][:attributes]).to have_key(:api_key)
    expect(user_json[:data][:attributes][:api_key]).to be_a(String)
  end
end
