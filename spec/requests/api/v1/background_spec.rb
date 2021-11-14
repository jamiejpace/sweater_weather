require 'rails_helper'

RSpec.describe 'background endpoint', :vcr do
  it 'retrieves background image for a city' do
    get '/api/v1/backgrounds', params: {location: 'denver,co'}

    expect(response).to be_successful

    background = JSON.parse(response.body, symbolize_names: true)

    expect(background).to be_a(Hash)
    expect(background).to have_key(:data)
    expect(background[:data]).to be_a(Hash)
    expect(background[:data]).to have_key(:id)
    expect(background[:data]).to have_key(:type)
    expect(background[:data]).to have_key(:attributes)
    expect(background[:data][:attributes]).to be_a(Hash)
  end

  it 'renders a 400 if no location given' do
    get '/api/v1/backgrounds'

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end
