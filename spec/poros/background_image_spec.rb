require 'rails_helper'

RSpec.describe BackgroundImage do
  it 'exists and has attributes' do
    data = {
      user: {
        location: "Denver, CO",
        name: "Sally Rooney"
        },
      urls: {
        full: "http://website.com.20923.jpeg"
        }
      }

    background = BackgroundImage.new(data)

    expect(background).to be_a(BackgroundImage)
    expect(background.location).to eq("Denver, CO")
    expect(background.image_url).to eq("http://website.com.20923.jpeg" )
    expect(background.author).to eq("Sally Rooney")
  end
end
