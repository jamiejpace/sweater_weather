class DailyForecast
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.at(data[:day][:dt]).to_s
    @sunrise = Time.at(data[:day][:sunrise]).to_s
    @sunset = Time.at(data[:day][:sunset]).to_s
    @max_temp = data[:day][:temp][:max]
    @min_temp = data[:day][:temp][:min]
    @conditions = data[:day][:weather].first[:description]
    @icon = data[:day][:weather].first[:icon]
  end
end
