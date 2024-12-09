class Api::V1::PreyController < ApplicationController
  
  def index
    animal = Animal.find_by(id: params[:animal_id])
    if animal
      render json: AnimalSerializer.new(animal.prey)
    else
      render json: { error: "Animal not found" }, status: :not_found
    end
  end
end
