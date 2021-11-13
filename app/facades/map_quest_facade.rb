class MapQuestFacade
  class << self
    def get_location(location)
      data = MapQuestService.location_data(location)
      result = data[:results].first[:locations].first[:latLng]
      Location.new(result)
    end
  end
end
