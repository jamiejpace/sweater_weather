require 'rails_helper'

RSpec.describe 'activities endpoint', :vcr do
  it 'retrieves activites for a given city' do
    get 'api/v1/activities?destination=chicago,il'

    expect(response).to be_successful
  end
end
