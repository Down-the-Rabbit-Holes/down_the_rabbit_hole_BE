class Api::V1::ParksController < ApplicationController
  
  def index
    parks = Park.all
    render json: ParkSerializer.new(parks)
  end

  def show
    park = Park.find(id: params[:id])
    # if park
      render json: ParkSerializer.new(park)
    # else
    #   render json: { error: "Park not found" }, status: :not_found
    # end
  end
  
end