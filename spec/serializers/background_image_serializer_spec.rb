require 'rails_helper'

RSpec.describe 'background image serializer', :vcr do
  it 'serializes background image objects into json' do
    background = UnsplashImageFacade.find_image("denver,co")
    background_json = JSON.parse(BackgroundImageSerializer.new_unsplash(background).to_json, symbolize_names: true)

    expect(background_json).to be_a(Hash)
    expect(background_json).to have_key(:data)
    expect(background_json[:data]).to be_a(Hash)
    expect(background_json[:data]).to have_key(:id)
    expect(background_json[:data][:id]).to eq(nil)
    expect(background_json[:data]).to have_key(:type)
    expect(background_json[:data][:type]).to eq("image")
    expect(background_json[:data]).to have_key(:attributes)
    expect(background_json[:data][:attributes]).to be_a(Hash)
    expect(background_json[:data][:attributes]).to have_key(:image)
    expect(background_json[:data][:attributes][:image]).to be_a(Hash)
    expect(background_json[:data][:attributes][:image]).to have_key(:location)
    expect(background_json[:data][:attributes][:image][:location]).to be_a(String)
    expect(background_json[:data][:attributes][:image]).to have_key(:image_url)
    expect(background_json[:data][:attributes][:image][:image_url]).to be_a(String)
    expect(background_json[:data][:attributes][:image]).to have_key(:credit)
    expect(background_json[:data][:attributes][:image][:credit]).to be_a(Hash)
    expect(background_json[:data][:attributes][:image][:credit]).to have_key(:source)
    expect(background_json[:data][:attributes][:image][:credit][:source]).to be_a(String)
    expect(background_json[:data][:attributes][:image][:credit]).to have_key(:author)
    expect(background_json[:data][:attributes][:image][:credit][:author]).to be_a(String)
  end
end
