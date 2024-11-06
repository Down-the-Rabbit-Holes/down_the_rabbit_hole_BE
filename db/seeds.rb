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
    photo_url: "https://images.pexels.com/photos/326012/pexels-photo-326012.jpeg", 
    prey: "Clover, Grass, Crunchy vegetables",
    predators: "Fox, wolf, owl, bobcat, weasel, stoat, hawk", 
    habitat: "forest thickets, meadows and woodland",
    fun_fact: "There are more than 50 different species!",
    top_speed: "18 miles per hour",
    life_span: "4-9 years",
    weight: "0.5-3kg (1.1-6.6lbs)",
    diet: "Herbivore",
    scientific_name: "oryctolagus cuniculus"
    )

Animal.create!(
    name: "Coyote", 
    photo_url: "https://images.pexels.com/photos/23511068/pexels-photo-23511068/free-photo-of-close-up-of-a-coyote-standing-on-a-field.jpeg?auto=compress&cs=tinysrgb&w=600", 
    prey: "Rabbit, Mice, Deer",
    predators: "Human, Bears, Wolves, Great horned owls, Bald Eagles", 
    habitat: "Forests, plains and deserts",
    fun_fact: "Also known as the Prairie Wolf!",
    top_speed: "40 miles per hour",
    life_span: "10 - 15 years",
    weight: "7kg - 21kg (15lbs - 46lbs)",
    diet: "Carnivore",
    scientific_name: "Canis latrans"
    )

Animal.create!(
    name: "Barred Owl",
    photo_url: "https://images.pexels.com/photos/12755682/pexels-photo-12755682.jpeg?auto=compress&cs=tinysrgb&w=600",
    prey: "Mammals, including house mice and rabbits, other birds, amphibians, reptiles, insects and other invertebrates and even fish.",
    predators: "Raccoons, weasels, great horned owls, humans",
    habitat: "Forests, especially old growth forests near bodies of water, wooded swamps",
    scientific_name: "Strix varia",
    fun_fact: "Barred owls are active during the day, which is unusual for owls.",
    top_speed: "30 mph",
    life_span: "18 years",
    weight: "Males weigh 1 to 1.8 pounds, females weigh about 1.8 to 2 pounds",
    diet: "Carnivore"
    )

Animal.create!(
    name: "Mountain Lion",
    photo_url: "https://images.pexels.com/photos/53001/cougar-mountain-lion-puma-concolor-big-cat-53001.jpeg?auto=compress&cs=tinysrgb&w=600",
    prey: "Deer, Elk, Beavers",
    predators: "Human, Grizzly Bear, Wolves, Jaguars",
    habitat: "Forest and mountainous regions",
    scientific_name: "Felis Concolor",
    fun_fact: "Has no real natural predators!",
    top_speed: "30 mph",
    life_span: "10-20 years",
    weight: "29-90kg (64-198lbs)",
    diet: "Carnivore"
    )