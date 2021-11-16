require 'rails_helper'

RSpec.describe Forecast do
  it 'exists and has attributes', :vcr do
    data = OpenWeatherService.weather_data(39.738453, -104.984853)
    forecast = Forecast.new(data)

    expect(forecast).to be_a(Forecast)
    expect(forecast.current).to be_a(CurrentForecast)
    expect(forecast.hourly.first).to be_a(HourlyForecast)
    expect(forecast.daily.first).to be_a(DailyForecast)
  end
end
