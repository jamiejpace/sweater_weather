class RoadTripSerializer
  def self.new(locations, time, arrival_weather)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": locations[:origin],
          "end_city": locations[:destination],
          "travel_time": time,
          "weather_at_eta": {
            "temperature": arrival_weather[:temp],
            "conditions": arrival_weather[:weather].first[:description]
          }
        }
      }
    }
  end
end
