class Api::V1::ActivitiesController < ApplicationController
  def index
    location = MapQuestFacade.get_location(params[:destination])
    current_forecast = OpenWeatherFacade.get_weather(location.latitude, location.longitude).current
    activities = BoredFacade.get_two_activitites(current_forecast[:temp])
  end
end
