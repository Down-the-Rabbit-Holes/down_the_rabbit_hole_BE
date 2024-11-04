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


  def predators_with_data
    predators = self.predators.split(',').map(&:strip).map(&:singularize)
    predators_data = predators.flat_map do |predator_name|
      Animal.where("name ILIKE ?", "%#{predator_name}%")
    end
  end

  def self.find_animal(params)
    animal = Animal.where("name ILIKE ?", "%#{params[:name]}%")
  end

  def self.format_predators(animal)
    predators = animal.flat_map do |animal|
      animal.predators.gsub(/\band\b/, '').split(', ').map(&:strip).map(&:singularize)
    end
  end
end
