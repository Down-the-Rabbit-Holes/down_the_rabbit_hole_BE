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
    predators = self.predators.gsub(/\band\b/, '').split(',').map(&:strip).map(&:singularize)
    predators_data = predators.flat_map do |predator_name|
      Animal.where("name ILIKE ?", "%#{predator_name}%")
    end
    predators_data
  end

  def self.find_animal(params)
    where("name ILIKE ?", "%#{params[:name]}%")
  end

  def self.handle_predator_creation(animal)
    predators = Animal.format_predators(animal)
    predators_data = predators.each_with_object([]) do |predator_name, created_preds|
      # each w obj allows us to array up the preds and return at once.  
      # in case pred_name fails
      unless Animal.where("name ILIKE ?", predator_name).exists?
        animal_response = AnimalGateway.fetch_animal_data(predator_name)
        photo_response = AnimalGateway.fetch_photo_data(predator_name)
        if animal_response && photo_response
          new_animal = AnimalDetail.new(animal_response, photo_response).as_json
          created_preds << Animal.create(new_animal)
        end
      end
    end
    predators_data
  end

  # private

  def self.format_predators(animal)
    # animal.predators.gsub(/\band\b/, '').split(', ').map(&:strip).map(&:singularize)
        # Had to refactor here. In testing I discovered that calling flat_map on animal was failing
        # b/c animal is an object and flat_map is an array method -SJB
    predators = animal.flat_map do |animal|
      animal.predators.gsub(/\band\b/, '').split(', ').map(&:strip).map(&:singularize)
    end
  end

  # def self.animal_exists(animal)
  #   valid_animal = Animal.where("name ILIKE ?", "%#{animal}%")
  #   valid_animal.empty?
  # end
end