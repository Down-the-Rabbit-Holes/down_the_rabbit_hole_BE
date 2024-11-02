class Api::V1::AnimalsController < ApplicationController

# def show_home
# animal = "rabbit"

# animal = Animal.find_by(name: "animal name") || animal.fetch from api
#  def predator chain

  def create
    if params[:action_type] == "start"
      rabbit = Animal.find_by(name: "rabbit")

      if rabbit
        predators = rabbit.predators.split(',').map(&:strip).first(3)
        predators_data = predators.map do |predator_name|
          animal_response = AnimalGateway.fetch_animal_data(predator_name)
          
          photo_response = AnimalGateway.fetch_photo_data(predator_name)

              AnimalDetail.new(animal_response, photo_response) if animal_response
            end
         render json: rabbit
      else
        render json: { error: "Rabbit not found" }, status: :not_found
      end
    end
  end

  private
 
  def animal_params
    params.require(:animal).permit(:name, :action_type)
  end
end
