class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: 200
    else
      render json: { error: "Credentials are incorrect" }, status: :bad_request
    end
  end
end
