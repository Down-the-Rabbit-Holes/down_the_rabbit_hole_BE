class Api::V1::ParkAnimalsController < ApplicationController

  def index
    park = Park.find(params[:id])
    # if park
      animals = park.animals.order(:name)
      render json: AnimalSerializer.new(animals)
    # else
    #   render json: { error: "Park not found" }, status: :not_found
    # end
  end

end
