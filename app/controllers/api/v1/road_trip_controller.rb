class Api::V1::RoadTripController < ApplicationController
  before_action :require_valid_key

  def create
    trip_time = MapQuestFacade.get_route_data(params[:origin], params[:destination])
    coordinates = MapQuestFacade.get_location(params[:destination])
    arrival_weather = OpenWeatherFacade.get_future_weather(coordinates, number_of_hours(trip_time))
    render json: RoadTripSerializer.new(origin_and_destination, trip_time, arrival_weather), status: 200
  end

  private

  def valid_key
    User.find_by(access_token: params[:api_key])
  end

  def require_valid_key
    render json: { error: "Unauthorized request" }, status: 401 unless valid_key
  end

  def number_of_hours(time)
    time.split(':').first.to_i
  end

  def origin_and_destination
    {
      origin: params[:origin],
      destination: params[:destination]
    }
  end
end
