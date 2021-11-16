class CurrentForecast
 attr_reader :datetime,
             :sunrise,
             :sunset,
             :temperature,
             :feels_like,
             :humidity,
             :uvi,
             :visibility,
             :conditions,
             :icon

  def initialize(data)
    @datetime = Time.at(data[:current][:dt]).to_s
    @sunrise = Time.at(data[:current][:sunrise]).to_s
    @sunset = Time.at(data[:current][:sunset]).to_s
    @temperature = data[:current][:temp]
    @feels_like = data[:current][:feels_like]
    @humidity = data[:current][:humidity]
    @uvi = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @conditions = data[:current][:weather].first[:description]
    @icon = data[:current][:weather].first[:icon]
  end
end
