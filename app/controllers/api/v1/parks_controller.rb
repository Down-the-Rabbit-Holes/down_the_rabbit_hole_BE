class Api::V1::ParksController < ApplicationController
  
    def index
      parks = Park.all
      render json: ParkSerializer.new(parks)
    end
  
    def show
        park = Park.find_by(name: params[:id])
        if park
          render json: ParkSerializer.new(park)
        else
          render json: { error: "Park not found" }, status: :not_found
        end
      end
    
    def animals
      park = Park.find_by(name: params[:name])
      if park
        render json: AnimalSerializer.new(park.animals)
      else
        render json: { error: "Park not found" }, status: :not_found
      end
    end
  end