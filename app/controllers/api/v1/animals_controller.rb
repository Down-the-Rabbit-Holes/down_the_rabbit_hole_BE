require 'active_support/inflector'

class Api::V1::AnimalsController < ApplicationController

  def index
    if params[:action_type] == "eat_me"
      animal = Animal.find_by(name: params[:animal_name])

      predators = animal.predators.split(',').map(&:strip).map(&:singularize).first(3)
      predators_data = predators.map do |predator_name|
        Animal.where("name ILIKE '%#{predator_name}%'")
      end.flatten
      render json: AnimalSerializer.new(predators_data)
    end
  end

  def create
    if params[:action_type] == "start" || params[:action_type] == "selected_animal"
      animal_name = params[:animal_name] || "rabbit"
      animal = Animal.find_by(name: animal_name)

      if animal
        predators = animal.predators.split(',').map(&:strip).map(&:singularize).first(3)
        predators_data = predators.map do |predator_name|
          animal_response = AnimalGateway.fetch_animal_data(predator_name)
          photo_response = AnimalGateway.fetch_photo_data(predator_name)
          new_animal = AnimalDetail.new(animal_response, photo_response).as_json if animal_response
          Animal.create(new_animal)
        end
        render json: AnimalSerializer.new(animal)
        # render json: AnimalSerializer.new(predators_data)
      else
        render json: { error: "Animal not found" }, status: :not_found
      end
    end
  end

  private
 
  def animal_params
    params.require(:animal).permit(:name, :action_type, :id)
  end
end
