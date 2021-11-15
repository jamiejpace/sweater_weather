class MapQuestService
  class << self
    def location_data(location)
      response = conn.get("/geocoding/v1/address") do |req|
        req.params['location'] = location
      end
      body = parse_json(response)
    end

    def route_data(from, to)
      response = conn.get("/directions/v2/route") do |req|
        req.params['from'] = from
        req.params['to'] = to
      end
      body = parse_json(response)
    end

    private

    def conn
      Faraday.new("http://www.mapquestapi.com")  do |req|
        req.params['key'] = ENV['map_consumer_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
