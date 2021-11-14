class ForecastSerializer
  def self.new (forecast)
    {
      "data": {
        "id": nil,
        "type": "forecast",
        "attributes": {
          "current_weather": forecast.current_weather,
          "daily_weather": forecast.daily_weather,
          "hourly_weather": forecast.hourly_weather
        }
      }
    }
  end
end
