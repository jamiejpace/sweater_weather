require 'rails_helper'

RSpec.describe Forecast do
  it 'exists and has attributes' do
    data = { current: { temp: 51 }, hourly: [ { temp: 51 } ], daily: [ { temp: 51 } ] }
    forecast = Forecast.new(data)

    expect(forecast).to be_a(Forecast)
    expect(forecast.current).to be_a(Hash)
    expect(forecast.hourly).to be_a(Array)
    expect(forecast.daily).to be_a(Array)
  end
end
