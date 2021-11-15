class BoredService
  class << self
    def activity_data(activity_type)
      response = conn.get("/api/activity?type=#{activity_type}")
      body = parse_json(response)
    end

    private

    def conn
      Faraday.new("http://www.boredapi.com")
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
