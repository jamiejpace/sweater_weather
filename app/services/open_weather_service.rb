class OpenWeatherService
  class << self
    def weather_data(latitude, longitude)
      response = conn.get("/data/2.5/onecall") do |req|
        req.params['lat'] = latitude
        req.params['lon'] = longitude
        req.params['units'] = "imperial"
      end
      body = parse_json(response)
    end

    private

    def conn
      Faraday.new("https://api.openweathermap.org") do |req|
        req.params['appid'] = ENV['weather_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
