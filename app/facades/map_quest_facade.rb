class MapQuestFacade
  class << self
    def get_location(location)
      data = MapQuestService.location_data(location)
      result = data[:results].first[:locations].first[:latLng]
      Location.new(result)
    end

    def get_route_time(from, to)
      data = MapQuestService.route_data(from, to)
      data[:route][:formatedTime]
    end
  end
end
