require 'rails_helper'

RSpec.describe 'forecast endpoint', :vcr do
  it 'retrieves weather for a city' do
    get '/api/v1/forecast', params: {location: 'denver,co'}

    expect(response).to be_successful

    weather = JSON.parse(response.body, symbolize_names: true)
  
    expect(weather).to be_a(Hash)
    expect(weather).to have_key(:data)
    expect(weather[:data]).to be_a(Hash)
    expect(weather[:data]).to have_key(:id)
    expect(weather[:data]).to have_key(:type)
    expect(weather[:data]).to have_key(:attributes)
    expect(weather[:data][:attributes]).to be_a(Hash)

    expect(weather[:data][:attributes]).to have_key(:current_weather)
    expect(weather[:data][:attributes][:current_weather]).to be_a(Hash)
    expect(weather[:data][:attributes][:current_weather]).to_not have_key(:moonrise)
    expect(weather[:data][:attributes][:current_weather]).to_not have_key(:moonset)
    expect(weather[:data][:attributes][:current_weather]).to_not have_key(:moonphase)
    expect(weather[:data][:attributes][:current_weather]).to_not have_key(:dewpoint)
    expect(weather[:data][:attributes][:current_weather]).to_not have_key(:wind_speed)
    expect(weather[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(weather[:data][:attributes][:current_weather][:datetime]).to be_a(String)
    expect(weather[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(weather[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
    expect(weather[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(weather[:data][:attributes][:current_weather][:sunset]).to be_a(String)
    expect(weather[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(weather[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
    expect(weather[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(weather[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
    expect(weather[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(weather[:data][:attributes][:current_weather][:humidity]).to be_a(Integer)
    expect(weather[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(weather[:data][:attributes][:current_weather][:uvi]).to be_a(Float)
    expect(weather[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(weather[:data][:attributes][:current_weather][:visibility]).to be_a(Integer)
    expect(weather[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(weather[:data][:attributes][:current_weather][:conditions]).to be_a(String)
    expect(weather[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(weather[:data][:attributes][:current_weather][:icon]).to be_a(String)

    expect(weather[:data][:attributes]).to have_key(:daily_weather)
    expect(weather[:data][:attributes][:daily_weather]).to be_an(Array)
    expect(weather[:data][:attributes][:daily_weather].first).to be_a(Hash)
    expect(weather[:data][:attributes][:daily_weather].first).to have_key(:date)
    expect(weather[:data][:attributes][:daily_weather].first[:date]).to be_a(String)
    expect(weather[:data][:attributes][:daily_weather].first).to have_key(:sunrise)
    expect(weather[:data][:attributes][:daily_weather].first[:sunrise]).to be_a(String)
    expect(weather[:data][:attributes][:daily_weather].first).to have_key(:max_temp)
    expect(weather[:data][:attributes][:daily_weather].first[:max_temp]).to be_a(Float)
    expect(weather[:data][:attributes][:daily_weather].first).to have_key(:min_temp)
    expect(weather[:data][:attributes][:daily_weather].first[:min_temp]).to be_a(Float)
    expect(weather[:data][:attributes][:daily_weather].first).to have_key(:conditions)
    expect(weather[:data][:attributes][:daily_weather].first[:conditions]).to be_a(String)
    expect(weather[:data][:attributes][:daily_weather].first).to have_key(:icon)
    expect(weather[:data][:attributes][:daily_weather].first[:icon]).to be_a(String)

    expect(weather[:data][:attributes]).to have_key(:hourly_weather)
    expect(weather[:data][:attributes][:hourly_weather]).to be_an(Array)
    expect(weather[:data][:attributes][:hourly_weather].first).to be_a(Hash)
    expect(weather[:data][:attributes][:hourly_weather].first).to have_key(:time)
    expect(weather[:data][:attributes][:hourly_weather].first[:time]).to be_a(String)
    expect(weather[:data][:attributes][:hourly_weather].first).to have_key(:temperature)
    expect(weather[:data][:attributes][:hourly_weather].first[:temperature]).to be_a(Float)
    expect(weather[:data][:attributes][:hourly_weather].first).to have_key(:conditions)
    expect(weather[:data][:attributes][:hourly_weather].first[:conditions]).to be_a(String)
    expect(weather[:data][:attributes][:hourly_weather].first).to have_key(:icon)
    expect(weather[:data][:attributes][:hourly_weather].first[:icon]).to be_a(String)
  end

  it 'returns a 400 if no location given' do
    get '/api/v1/forecast'

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end
