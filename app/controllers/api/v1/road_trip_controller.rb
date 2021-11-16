class Api::V1::RoadTripController < ApplicationController
  before_action :require_valid_key
  before_action :require_origin_and_destination

  def create
    if trip_time
      coordinates = MapQuestFacade.get_location(destination)
      arrival_weather = OpenWeatherFacade.get_future_weather(coordinates, trip_time)
      render json: RoadTripSerializer.new(origin, destination, trip_time, arrival_weather), status: 200
    else
      render json: RoadTripSerializer.no_route(origin, destination), status: 200
    end
  end

  private

  def trip_time
    trip_time = MapQuestFacade.get_route_data(origin, destination)
  end

  def require_origin_and_destination
    render json: { error: "bad request" }, status: :bad_request unless origin && destination
  end

  def origin
    params[:origin]
  end

  def destination
    params[:destination]
  end

  def valid_key
    User.find_by(access_token: params[:api_key])
  end

  def require_valid_key
    render json: { error: "Unauthorized request" }, status: 401 unless valid_key
  end
end
