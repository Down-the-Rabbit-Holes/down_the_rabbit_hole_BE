class Api::V1::AnimalsController < ApplicationController
  def create
    if params[:action_type] == "start"
      rabbit = Animal.find_by(name: "rabbit")

      if rabbit
        predators = rabbit.predators.split(',').map(&:strip).first(3)
        predators_data = predators.map do |predator_name|
          animal_api_key = Rails.application.credentials.ninja_animals[:key]
          picture_api_key = Rails.application.credentials.pexels[:key]
          animal_conn = Faraday.new(url: "https://api.api-ninjas.com")
          picture_conn = Faraday.new(url: "https://api.pexels.com") do |faraday|
            faraday.headers["Authorization"] = Rails.application.credentials.pexels[:key]
          end
        
          animal_response = animal_conn.get("/v1/animals?name=#{predator_name}", { "X-Api-Key": animal_api_key })
          photo_response = picture_conn.get("/v1/search?query=#{predator_name}")

          if animal_response.success? 
            photo_data = JSON.parse(photo_response.body, symbolize_names: true)
            animal_data = JSON.parse(animal_response.body, symbolize_names: true)
            selected_animal = animal_data.find do |animal|
              animal[:locations].include?("North-America") &&
              animal.dig(:characteristics, :habitat) &&
              animal.dig(:characteristics, :predators) &&
              ( animal.dig(:characteristics, :prey) ||
              animal.dig(:characteristics, :main_prey) )
            end

            if selected_animal
             predator = Animal.create(
                name: selected_animal[:name],
                photo_url: photo_data[:photos].first[:url],
                prey: (selected_animal.dig(:characteristics, :main_prey) || selected_animal.dig(:characteristics, :prey)),
                predators: selected_animal.dig(:characteristics, :predators),
                habitat: selected_animal.dig(:characteristics, :habitat),
                scientific_name: selected_animal.dig(:taxonomy, :scientific_name)
                )
              predator
            end
          else
            Rails.logger.error("Failed to fetch data for #{predator_name}")
          end
        end
        return render json: predators_data
      else
        render json: { error: "Rabbit not found" }, status: :not_found
      end
    else
      render json: { error: "Invalid action type" }, status: :bad_request
    end
  end

  private
 
  def animal_params
    params.require(:animal).permit(:name, :action_type)
  end
end
