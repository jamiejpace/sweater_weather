class Api::V1::RoadTripController < ApplicationController
  before_action :require_valid_key

  def create
    trip_time = MapQuestFacade.get_route_time(params[:origin], params[:destination])
    coordinates = MapQuestFacade.get_location(params[:destination])
  end

  private

  def valid_key
    User.find_by(access_token: params[:api_key])
  end

  def require_valid_key
    render json: { error: "Unauthorized request" }, status: 401 unless valid_key
  end
end
