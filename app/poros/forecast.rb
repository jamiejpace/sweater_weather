class Forecast
  attr_reader :current, :daily, :hourly

  def initialize(data)
    @current = CurrentForecast.new(data)
    @daily = five_daily_forecasts(data)
    @hourly = eight_hourly_forecasts(data)
  end

  def five_daily_forecasts(data)
    data[:daily][0..4].map do |day|
      DailyForecast.new(day)
    end
  end

  def eight_hourly_forecasts(data)
    data[:hourly][0..7].map do |hour|
      HourlyForecast.new(hour)
    end
  end
end
