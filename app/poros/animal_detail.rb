# class AnimalDetail
#   attr_reader :name, 
#               :photo_url, 
#               :prey, 
#               :predators, 
#               :habitat, 
#               :scientific_name,
#               :fun_fact,
#               :top_speed,
#               :life_span,
#               :weight,
#               :diet

#   def initialize (animal_data, photo_data)
#     @name = animal_data[:name]
#     @photo_url = photo_data[:photos].first[:src][:large]
#     @prey = (animal_data.dig(:characteristics, :main_prey) || animal_data.dig(:characteristics, :prey))
#     @predators = (animal_data.dig(:characteristics, :predators) || "Human")
#     @habitat = (animal_data.dig(:characteristics, :habitat) || default_message)
#     @fun_fact = (animal_data.dig(:characteristics, :slogan) || "Do not pet this animal in the wild!")
#     @top_speed = (animal_data.dig(:characteristics, :top_speed) || default_message)
#     @life_span = (animal_data.dig(:characteristics, :lifespan) || default_message)
#     @weight = (animal_data.dig(:characteristics, :weight) || default_message)
#     @diet = (animal_data.dig(:characteristics, :diet) || default_message)
#     @scientific_name = (animal_data.dig(:taxonomy, :scientific_name) || default_message)
#   end

#   private

#   def default_message
#     "Ask your parents!"
#   end
# end