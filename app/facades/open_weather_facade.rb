class OpenWeatherFacade
  class << self
    def get_weather(latitude, longitude)
      data = OpenWeatherService.weather_data(latitude, longitude)
      Forecast.new(data)
    end

    def get_future_weather(latitude, longitude, time)
      data = OpenWeatherService.weather_data(latitude, longitude)
    end
  end
end
