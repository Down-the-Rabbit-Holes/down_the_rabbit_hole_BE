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
    photo_url: "www.pexels.com/photo/two-playful-coyotes-27067820/", 
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
    photo_url: "www.pexels.com/photo/brown-and-black-owl-staring-86596/",
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
    photo_url: "https://www.pexels.com/photo/cougar-animal-53001/",
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

    User.create!(
        name: "Jim"
    )

    User.create!(
        name: "Candice"
    )

    UserFavorite.create!(
        animal_id: 1,
        user_id: 1
    )