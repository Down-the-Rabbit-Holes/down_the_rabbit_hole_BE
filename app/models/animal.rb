class Animal < ApplicationRecord
  has_many :user_favorites
  has_many :users, through: :user_favorites
  
  validates :name, uniqueness: true
  validates :photo_url, 
            :prey, 
            :predators, 
            :habitat, 
            :scientific_name, 
            :diet,
            :top_speed,
            :life_span,
            :weight,
            :fun_fact,
            presence: true

    # def predators_with_data
    #   predators = self.predators.split(',').map(&:strip).map(&:singularize).first(3)
    #   predators_data = predators.map do |predator_name|
    #     Animal.where("name ILIKE '%#{predator_name}%'")
    #   end.flatten
    # end

    def predators_with_data
      predators = self.predators.split(',').map(&:strip).map(&:singularize).first(3)
      predators_data = predators.flat_map do |predator_name|
        Animal.where("name ILIKE ?", "%#{predator_name}%").limit(1) 
      end
      
    end

    def create_predators_data
      predators_with_data.each do |predator|
        animal_response = AnimalGateway.fetch_animal_data(predator.name)
        photo_response = AnimalGateway.fetch_photo_data(predator.name)
        new_animal = AnimalDetail.new(animal_response, photo_response).as_json if animal_response
        Animal.create(new_animal)
      end
    end

    def prey_with_data
      prey_items = self.prey.split(',').map(&:strip).map(&:singularize).first(3)
      prey_data = prey_items.flat_map do |prey_name|
        Animal.where("name ILIKE ?", "%#{prey_name}%").limit(1) 
      end
    end
end
