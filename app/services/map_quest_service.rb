class MapQuestService
  class << self
    def location_data(location)
      response = conn.get("/geocoding/v1/address?location=#{location}&key=#{ENV['map_consumer_key']}")
      body = parse_json(response)
    end

    private

    def conn
      Faraday.new("http://www.mapquestapi.com")
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
