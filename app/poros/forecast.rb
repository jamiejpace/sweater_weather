class Forecast
  attr_reader :current, :daily, :hourly

  def initialize(data)
    @current = data[:current]
    @daily = data[:daily]
    @hourly = data[:hourly]
  end

  def current_weather
    {
      datetime: Time.at(@current[:dt]).to_s,
      sunrise: Time.at(@current[:sunrise]).to_s,
      sunset: Time.at(@current[:sunset]).to_s,
      temperature: @current[:temp],
      feels_like: @current[:feels_like],
      humidity: @current[:humidity],
      uvi: @current[:uvi],
      visibility: @current[:visibility],
      conditions: @current[:weather].first[:description],
      icon: @current[:weather].first[:icon]
    }
  end

  def daily_weather
    @daily[0..4].map do |day|
      {
        date: Time.at(day[:dt]).to_s,
        sunrise: Time.at(day[:sunrise]).to_s,
        sunset: Time.at(day[:sunset]).to_s,
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather].first[:description],
        icon: day[:weather].first[:icon]
      }
    end
  end

  def hourly_weather
    @hourly[0..7].map do |hour|
      {
        time: Time.at(hour[:dt]).to_s,
        temperature: hour[:temp],
        conditions: hour[:weather].first[:description],
        icon: hour[:weather].first[:icon]
      }
    end
  end
end
