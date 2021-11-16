class OpenWeatherFacade
  class << self
    def get_weather(latitude, longitude)
      data = OpenWeatherService.weather_data(latitude, longitude)
      Forecast.new(data)
    end

    def get_future_weather(coordinates, time)
      data = OpenWeatherService.weather_data(coordinates.latitude, coordinates.longitude)
      hourly_forecasts = data[:hourly].map do |hour|
        HourlyForecast.new(hour)
      end
      hourly_forecasts[time]
    end
  end
end
