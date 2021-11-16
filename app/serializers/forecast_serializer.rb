class ForecastSerializer
  def self.new(forecast)
    {
      "data": {
        "id": nil,
        "type": "forecast",
        "attributes": {
          "current_weather": {
            "datetime": forecast.current.datetime,
            "sunrise": forecast.current.sunrise,
            "sunset": forecast.current.sunset,
            "temperature": forecast.current.temperature,
            "feels_like": forecast.current.feels_like,
            "humidity": forecast.current.humidity,
            "uvi": forecast.current.uvi,
            "visibility": forecast.current.visibility,
            "conditions": forecast.current.conditions,
            "icon": forecast.current.icon
          },
          "daily_weather": forecast.daily.map do |d|
            {
              "date": d.date,
              "sunrise": d.sunrise,
              "sunset": d.sunset,
              "max_temp": d.max_temp,
              "min_temp": d.min_temp,
              "conditions": d.conditions,
              "icon": d.icon
            }
          end,
          "hourly_weather": forecast.hourly.map do |h|
            {
              "time": h.time,
              "temperature": h.temperature,
              "conditions": h.conditions,
              "icon": h.icon
            }
          end
        }
      }
    }
  end
end
