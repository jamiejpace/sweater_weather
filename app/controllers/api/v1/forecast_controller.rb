class Api::V1::ForecastController < ApplicationController
  def show
    location = MapQuestFacade.get_location(params[:location])
    weather = OpenWeatherFacade.get_weather(location.latitude, location.longitude)
  end
end
