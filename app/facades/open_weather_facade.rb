class OpenWeatherFacade
  class << self
    def get_weather(latitude, longitude)
      data = OpenWeatherService.weather_data(latitude, longitude)
      Forecast.new(data)
    end

    def get_future_weather(coordinates, time)
      data = OpenWeatherService.weather_data(coordinates.latitude, coordinates.longitude)
      forecast = Forecast.new(data)
      forecast.hourly[time]
    end
  end
end
