class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location]
      background = UnsplashImageFacade.find_image(params[:location])
      render json: BackgroundImageSerializer.new_unsplash(background), status: :ok
    else
      render json: { error: "bad request" }, status: :bad_request
    end
  end
end
