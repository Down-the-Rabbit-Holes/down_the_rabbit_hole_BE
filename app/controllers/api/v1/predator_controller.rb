class Api::V1::PredatorController < ApplicationController
  
  def index
    animal = Animal.find_by(id: params[:animal_id])
    if animal
      render json: AnimalSerializer.new(animal.predators)
    else
      render json: { error: "Animal not found" }, status: :not_found
    end
  end
end
