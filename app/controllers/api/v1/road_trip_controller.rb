class Api::V1::RoadTripController < ApplicationController
  before_action :require_valid_key

  def create
    origin = params[:origin]
    destination = params[:destination]
    trip_time = MapQuestFacade.get_route_data(origin, destination)
    if trip_time
      coordinates = MapQuestFacade.get_location(destination)
      arrival_weather = OpenWeatherFacade.get_future_weather(coordinates, trip_time)
      render json: RoadTripSerializer.new(origin, destination, trip_time, arrival_weather), status: 200
    else
      render json: RoadTripSerializer.no_route(origin, destination), status: 200
    end
  end

  private

  def valid_key
    User.find_by(access_token: params[:api_key])
  end

  def require_valid_key
    render json: { error: "Unauthorized request" }, status: 401 unless valid_key
  end
end
