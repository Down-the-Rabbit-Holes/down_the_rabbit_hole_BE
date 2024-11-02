class AnimalDetail
  attr_reader :name, 
              :photo_url, 
              :prey, 
              :predators, 
              :habitat, 
              :scientific_name

  def initialize (animal_data, photo_data)
    @name = animal_data[:name]
    @photo_url = photo_data[:photos].first[:url]
    @prey = (animal_data.dig(:characteristics, :main_prey) || animal_data.dig(:characteristics, :prey))
    @predators = animal_data.dig(:characteristics, :predators)
    @habitat = animal_data.dig(:characteristics, :habitat)
    @scientific_name = animal_data.dig(:taxonomy, :scientific_name)
  end
end

