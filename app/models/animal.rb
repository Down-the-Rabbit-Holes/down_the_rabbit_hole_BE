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
    predator_names = self.predators.gsub(/\band\b/, '').split(',').map(&:strip).map(&:singularize)
    Animal.where('name ILIKE ANY (ARRAY[?])', predator_names.map { |name| "%#{name}%" })
  end

  def self.find_animal(params)
    find_by("name ILIKE ?", "%#{params[:name]}%")
  end

  def self.handle_predator_creation(animal)
    predators = format_predators(animal)
    predators.each do |predator_name|
      next if Animal.where("name ILIKE ?", "%#{predator_name}%").exists?
  
      animal_response = AnimalGateway.fetch_animal_data(predator_name)
      photo_response = AnimalGateway.fetch_photo_data(predator_name)
      if animal_response && photo_response
        new_animal = AnimalDetail.new(animal_response, photo_response).as_json
        Animal.create(new_animal)
      end
    end
  end

  # private
  def self.format_predators(animal)
    animal.predators.gsub(/\band\b/, '').split(',').map(&:strip).map(&:singularize)
  end

end