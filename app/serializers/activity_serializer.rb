class ActivitySerializer
  def self.new(destination, current_forecast, activities)
    {
      "data": {
        "id": nil,
        "type": "activities",
        "attributes": {
          "destination": destination,
          "forecast": {
            "summary": current_forecast.conditions,
            "temperature": "#{current_forecast.temperature} F"
          },
          "activities": activities.map do |a|
            {
              "title": a.title,
              "type": a.type,
              "participants": a.participants,
              "price": a.price
            }
          end
        }
      }
    }
  end
end
