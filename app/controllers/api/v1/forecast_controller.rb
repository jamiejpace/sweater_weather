class Api::V1::ForecastController < ApplicationController
  def show
    if params[:location]
      location = MapQuestFacade.get_location(params[:location])
      forecast = OpenWeatherFacade.get_weather(location.latitude, location.longitude)
      render json: ForecastSerializer.new(forecast), status: :ok
    else
      render json: { error: "bad request" }, status: :bad_request
    end
  end
end
