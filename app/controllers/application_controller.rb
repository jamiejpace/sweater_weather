class ApplicationController < ActionController::API
  rescue_from JSON::ParserError, with: :bad_request

  private

  def bad_request
    render json: { error: "bad request" }, status: :bad_request
  end
end
