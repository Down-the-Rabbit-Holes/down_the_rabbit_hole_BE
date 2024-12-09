class Api::V1::AnimalsController < ApplicationController
  
  def show
    animal = Animal.find_by(id: params[:id])
    if animal
      render json: AnimalSerializer.new(animal)
    else
      render json: { error: "Animal not found" }, status: :not_found
    end
  end

  # def relationships
  #   animal = Animal.find_by(id: params[:id])
  #   if animal
  #     if filter_params[:predators]
  #       render json: AnimalSerializer.new(animal.predators)
  #     elsif filter_params[:prey]
  #       render json: AnimalSerializer.new(animal.prey)
  #     else
  #       render json: { error: "No valid filter provided" }, status: :bad_request
  #     end
  #   else
  #     render json: { error: "Animal not found" }, status: :not_found
  #   end
  # end
  
  # private
  
  # def filter_params
  #   params.permit(:predators, :prey)
  # end
end
