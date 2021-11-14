require 'rails_helper'

RSpec.describe 'open weather service', :vcr do
  it 'returns weather data about a given lat/longitude' do
    response = OpenWeatherService.weather_data(39.738453, -104.984853)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:current)
    expect(response[:current]).to be_a(Hash)
    expect(response).to have_key(:daily)
    expect(response[:daily]).to be_a(Array)
    expect(response).to have_key(:hourly)
    expect(response[:hourly]).to be_a(Array)
  end
end
