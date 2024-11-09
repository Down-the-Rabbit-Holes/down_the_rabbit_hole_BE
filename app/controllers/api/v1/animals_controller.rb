class Api::V1::AnimalsController < ApplicationController
  def index
    if params[:action_type] == "start" || params[:action_type] == "selected_animal"
      animal = Animal.find_animal(animal_params)
      if animal
        Animal.handle_predator_creation(animal)
        render json: AnimalSerializer.new(animal)
      else
        render json: { error: "Animal not found" }, status: :not_found
      end
    elsif params[:action_type] == "eat_me"
      animal = Animal.find_by(name: params[:animal_name])
      Animal.handle_predator_creation(animal) if animal
      predators_data = animal.predators_with_data
      render json: AnimalSerializer.new(predators_data)
    end
  end

  private
  
  def animal_params
    params.permit(:name, :action_type)
  end
end