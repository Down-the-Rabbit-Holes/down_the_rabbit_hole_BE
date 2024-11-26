class Api::V1::ParkAnimalsController < ApplicationController

  def index
    park = Park.find(params[:id])
    if park
      render json: AnimalSerializer.new(park.animals)
    else
      render json: { error: "Park not found" }, status: :not_found
    end
  end

end
