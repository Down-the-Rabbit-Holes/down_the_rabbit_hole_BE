class Api::V1::AnimalsController < ApplicationController
  def show
    animal = Animal.find(params[:id])
    if animal
      render json: AnimalSerializer.new(animal)
    end
  end

  def index
    animal = Animal.find_by(id: params[:id])
    if animal
      if filter_params[:predators]
        render json: AnimalSerializer.new(animal.predators)
      elsif filter_params[:prey]
        render json: AnimalSerializer.new(animal.prey)
      else
        render json: { error: "No valid filter provided" }, status: :bad_request
      end
    else
      render json: { error: "Animal not found" }, status: :not_found
    end
  end
  
  private
  
  def filter_params
    params.permit(:predators, :prey)
  end

end
  # def index
  #   if params[:action_type] == "start" || params[:action_type] == "selected_animal"
  #     animal = Animal.find_animal(animal_params)
  #     if animal
  #       Animal.handle_predator_creation(animal)
  #       render json: AnimalSerializer.new(animal)
  #     else
  #       render json: { error: "Animal not found" }, status: :not_found
  #     end
  #   elsif params[:action_type] == "eat_me"
  #     animal = Animal.find_by(name: params[:animal_name])
  #     Animal.handle_predator_creation(animal) if animal
  #     predators_data = animal.predators_with_data
  #     render json: AnimalSerializer.new(predators_data)
  #   end
  # end

  # def index
  #   # return either all predators or all prey
  #   # OR
  #   # do this in the relations table
  # end

  # def show
  #   # return the one animal
  #   animal = Animal.find(params[:id])
  #   render json: AnimalSerializer.new(animal)
  # end

  # private
  
  # # def animal_params
  # #   params.require(:animal).permit(:id, :name, :action_type)
  # # end
# end