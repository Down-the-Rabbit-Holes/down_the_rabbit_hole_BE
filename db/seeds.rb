# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Animal.create!(
    name: "rabbit", 
    photo_url: "www.pexels.com/photo/close-up-of-rabbit-on-field-247373/", 
    prey: "Clover, Grass, Crunchy vegetables",
    predators: "Fox, wolf, owl", 
    habitat: "forest thickets, meadows and woodland",
    fun_fact: "There are more than 50 different species!",
    top_speed: "18 miles per hour",
    life_span: "4-9 years",
    weight: "0.5-3kg (1.1-6.6lbs)",
    diet: "Herbivore",
    scientific_name: "oryctolagus cuniculus"
    )

Animal.create!(
    name: "tiger", 
    photo_url: "www.pexels.com/photo/close-up-of-rabbit-on-field-247373/", 
    prey: "Clover, Grass, Crunchy vegetables",
    predators: "Fox, wolf, owl", 
    habitat: "forest thickets, meadows and woodland",
    fun_fact: "There are more than 50 different species!",
    top_speed: "18 miles per hour",
    life_span: "4-9 years",
    weight: "0.5-3kg (1.1-6.6lbs)",
    diet: "Herbivore",
    scientific_name: "oryctolagus cuniculus"
    )