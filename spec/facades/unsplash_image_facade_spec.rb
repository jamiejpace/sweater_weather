require 'rails_helper'

RSpec.describe 'unsplash image facade', :vcr do
  it 'returns a background image object' do
    response = UnsplashImageFacade.find_image("Denver, CO")

    expect(response).to be_a(BackgroundImage)
  end
end
