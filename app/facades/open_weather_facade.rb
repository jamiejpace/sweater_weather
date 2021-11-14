class OpenWeatherFacade
  class << self
    def get_weather(latitude, longitude)
      data = OpenWeatherService.weather_data(latitude, longitude)
      Weather.new(data)
    end
  end
end