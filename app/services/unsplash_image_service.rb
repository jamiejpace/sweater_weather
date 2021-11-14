class UnsplashImageService
  class << self
    def image_data(location)
      response = conn.get("search/photos?query=#{location}+cityscape")
      body = parse_json(response)
    end

    private

    def conn
      Faraday.new("https://api.unsplash.com") do |req|
        req.params['client_id'] = ENV['background_access_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
