class Api::V1::AnimalsController < ApplicationController
  
  def show
    animal = Animal.find_by(id: params[:id])
    if animal
      render json: AnimalSerializer.new(animal)
    else
      render json: { error: "Animal not found" }, status: :not_found
    end
  end
end
