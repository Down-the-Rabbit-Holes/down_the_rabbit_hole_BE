class Api::V1::AnimalsController < ApplicationController

  def create
    if params[:action_type] == "start"
      rabbit = Animal.find_by(name: "rabbit")

      if rabbit
        predators = rabbit.predators.split(',').map(&:strip).first(3)
        predators_data = predators.map do |predator_name|
          animal_response = AnimalGateway.fetch_animal_data(predator_name)
          photo_response = AnimalGateway.fetch_photo_data(predator_name)
          new_animal = AnimalDetail.new(animal_response, photo_response).as_json if animal_response
          Animal.create(new_animal)
        end
        render json: AnimalSerializer.new(rabbit)
        # render json: AnimalSerializer.new(predators_data)
      else
        render json: { error: "Rabbit not found" }, status: :not_found
      end
    elsif params[:action_type] == "eat_me"
      # Do something on the EAT ME button click
      # render json: AnimalSerializer.new(predators_data)
    elsif params[:action_type] == "animal_select"
      # Do something on the predator selection click
        # IF
      # render json: AnimalSerializer.new(current animal)
    end
  end

  private
 
  def animal_params
    params.require(:animal).permit(:name, :action_type)
  end
end
