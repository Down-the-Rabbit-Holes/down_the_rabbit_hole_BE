class Api::V1::AnimalsController < ApplicationController
  # def create
  #   if params[:action] == "start"
  #      rabbit = Animal.find_by(name: "rabbit")
  #      predators = rabbit.predators.split(',').map(&:strip).first(3)
  #          predators_data = predators.map do |predator_name|
  #           animal_api_key = Rails.application.credentials.ninja_animals[:key]
  #           picture_api_key = Rails.application.credentials.pexels[:key]
  #           animal_conn = Faraday.new(url: "api.api-ninjas.com")
  #           picture_conn = Faraday.new(url: "api.pexels.com")
  #           animal_response = animal_conn.get("v1/animals?name=#{predator_name}", {"X-Api-Key": animal_api_key})
  #           photo_response = photo_conn.get("v1/search?query=#{predator_name}", headers: {Authorization: picture_api_key})
  #           photo_response = JSON.parse(photo_response.body, symbolize_names: true)
  #           animal_response = JSON.parse(animal_response.body, symbolize_names: true)
  #           require 'pry'; binding.pry
  #           animal = Animal.create(
  #             name: animal_response[:name], 
  #             photo_url: photo_response[:photo][0][:url], 
  #             prey: animal_response[:characteristics][:main_prey], 
  #             predators: animal_response[:characteristics][:predators], 
  #             habitat: animal_response[:characteristics][:habitat], 
  #             scientific_name: animal_response[:taxonomy][:scientific_name]
  #           )
  #          end
  #       render json: rabbit
  #   end
  # end

   

#   private
 

#   def params
#     params.require(:animal).permit(:name, :action)
#   end
# end

  def create
 
    if params[:action_type] == "start"
      rabbit = Animal.find_by(name: "rabbit")
      # require 'pry'; binding.pry
      if rabbit
        predators = rabbit.predators.split(',').map(&:strip).first(3)
        # require 'pry'; binding.pry
        predators_data = predators.map do |predator_name|
          animal_api_key = Rails.application.credentials.ninja_animals[:key]
          picture_api_key = Rails.application.credentials.pexels[:key]
          animal_conn = Faraday.new(url: "https://api.api-ninjas.com")
          picture_conn = Faraday.new(url: "https://api.pexels.com") do |faraday|
            faraday.headers["Authorization"] = Rails.application.credentials.pexels[:key]
          end
        
          # require 'pry'; binding.pry

          animal_response = animal_conn.get("/v1/animals?name=#{predator_name}", { "X-Api-Key": animal_api_key })
          # require 'pry'; binding.pry
          photo_response = picture_conn.get("/v1/search?query=#{predator_name}")

          if animal_response.success? 
            photo_data = JSON.parse(photo_response.body, symbolize_names: true)
            # require 'pry'; binding.pry
            animal_data = JSON.parse(animal_response.body, symbolize_names: true)
            selected_animal = animal_data.find do |animal|
              animal[:locations].include?("North-America") &&
              animal.dig(:characteristics, :habitat) &&
              animal.dig(:characteristics, :predators) &&
              animal.dig(:characteristics, :prey)
            end
            
            if selected_animal
             predator = Animal.create(
                name: selected_animal[:name],
                photo_url: photo_data[:photos].first[:url],
                prey: selected_animal.dig(:characteristics, :main_prey),
                predators: selected_animal.dig(:characteristics, :predators),
                habitat: selected_animal.dig(:characteristics, :habitat),
                scientific_name: selected_animal.dig(:taxonomy, :scientific_name)
                )
                # require 'pry'; binding.pry
            end
            return predator
            # return render json: predator
            # return predator
            # if animal_data 
            #   Animal.create(
            #     name: animal_data[:name],
            #     # photo_url: photo_data[:photos][0][:url], 
            #     prey: animal_data[:characteristics][:main_prey],
            #     predators: animal_data[:characteristics][:predators],
            #     habitat: animal_data[:characteristics][:habitat],
            #     scientific_name: animal_data[:taxonomy][:scientific_name]
            #   )
            # end
          else
            Rails.logger.error("Failed to fetch data for #{predator_name}")
          end
         
        end
        # require 'pry'; binding.pry
        return render json: predators_data
        # render json: rabbit
      # this is if the rabbit seed cannot be found
      else
        render json: { error: "Rabbit not found" }, status: :not_found
      end
      # This is for the action type
    else
      render json: { error: "Invalid action type" }, status: :bad_request
    end
  end




  private
 

  def animal_params
    params.require(:animal).permit(:name, :action_type)
  end
end
