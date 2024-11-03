class AnimalDetail
  attr_reader :name, 
              :photo_url, 
              :prey, 
              :predators, 
              :habitat, 
              :scientific_name,
              :fun_fact,
              :top_speed,
              :life_span,
              :weight,
              :diet

  def initialize (animal_data, photo_data)
    @name = animal_data[:name]
    @photo_url = photo_data[:photos].first[:url]
    @prey = (animal_data.dig(:characteristics, :main_prey) || animal_data.dig(:characteristics, :prey))
    @predators = (animal_data.dig(:characteristics, :predators) || "Human")
    @habitat = (animal_data.dig(:characteristics, :habitat) || "Ask your parents!")
    @fun_fact = (animal_data.dig(:characteristics, :slogan) || "Do not pet this animal in the wild!")
    @top_speed = (animal_data.dig(:characteristics, :top_speed) || "Ask your parents!")
    @life_span = (animal_data.dig(:characteristics, :lifespan) || "Ask your parents!")
    @weight = (animal_data.dig(:characteristics, :weight) || "Ask your parents!")
    @diet = (animal_data.dig(:characteristics, :diet) || "Ask your parents!")
    @scientific_name = (animal_data.dig(:taxonomy, :scientific_name) || "Ask your parents!")
  end
end

