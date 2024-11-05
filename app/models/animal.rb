class Animal < ApplicationRecord
  has_many :user_favorites
  has_many :users, through: :user_favorites
  
  validates :name, uniqueness: true
  validates :name,
            :photo_url, 
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


  def predators_with_data
    predators = self.predators.split(',').map(&:strip).map(&:singularize)
    predators_data = predators.flat_map do |predator_name|
      Animal.where("name ILIKE ?", "%#{predator_name}%")
    end
  end

  def self.find_animal(params)
    animal = Animal.where("name ILIKE ?", "%#{params[:name]}%")
  end

  def self.handle_predator_creation(animal)
    predators = Animal.format_predators(animal)
    predators_data = predators.map do |predator_name|
      if (!animal_exists(predator_name))
        animal_response = AnimalGateway.fetch_animal_data(predator_name)
        photo_response = AnimalGateway.fetch_photo_data(predator_name)
        new_animal = AnimalDetail.new(animal_response, photo_response).as_json if animal_response
        Animal.create(new_animal)
      end
    end
  end

  private

  def self.format_predators(animal)
    predators = animal.flat_map do |animal|
      animal.predators.gsub(/\band\b/, '').split(', ').map(&:strip).map(&:singularize)
    end
  end

  def self.animal_exists(animal)
    valid_animal = Animal.where("name ILIKE ?", "%#{animal}%")
    valid_animal.empty?
  end
end
