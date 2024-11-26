# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Animal.create!(
#   name: "rabbit", 
#   photo_url: "https://images.pexels.com/photos/326012/pexels-photo-326012.jpeg", 
#   prey: "Clover, Grass, Crunchy vegetables",
#   predators: "Fox, wolf, owl, bobcat, weasel, stoat, hawk, raccoon, mink,", 
#   habitat: "forest thickets, meadows and woodland",
#   fun_fact: "There are more than 50 different species!",
#   top_speed: "18 miles per hour",
#   life_span: "4-9 years",
#   weight: "0.5-3kg (1.1-6.6lbs)",
#   diet: "Herbivore",
#   scientific_name: "oryctolagus cuniculus"
# )

# Animal.create!(
#   name: "Coyote", 
#   photo_url: "https://images.pexels.com/photos/23511068/pexels-photo-23511068/free-photo-of-close-up-of-a-coyote-standing-on-a-field.jpeg?auto=compress&cs=tinysrgb&w=600", 
#   prey: "Rabbit, Mice, Deer",
#   predators: "Human, Bears, Wolves, Great horned owls, Bald Eagles", 
#   habitat: "Forests, plains and deserts",
#   fun_fact: "Also known as the Prairie Wolf!",
#   top_speed: "40 miles per hour",
#   life_span: "10 - 15 years",
#   weight: "7kg - 21kg (15lbs - 46lbs)",
#   diet: "Carnivore",
#   scientific_name: "Canis latrans"
# )

# Animal.create!(
#   name: "Barred Owl",
#   photo_url: "https://images.pexels.com/photos/12755682/pexels-photo-12755682.jpeg?auto=compress&cs=tinysrgb&w=600",
#   prey: "Mammals, including house mice and rabbits, other birds, amphibians, reptiles, insects and other invertebrates and even fish.",
#   predators: "Raccoons, weasels, great horned owls, humans",
#   habitat: "Forests, especially old growth forests near bodies of water, wooded swamps",
#   scientific_name: "Strix varia",
#   fun_fact: "Barred owls are active during the day, which is unusual for owls.",
#   top_speed: "30 mph",
#   life_span: "18 years",
#   weight: "Males weigh 1 to 1.8 pounds, females weigh about 1.8 to 2 pounds",
#   diet: "Carnivore"
# )

# Animal.create!(
#   name: "Mountain Lion",
#   photo_url: "https://images.pexels.com/photos/53001/cougar-mountain-lion-puma-concolor-big-cat-53001.jpeg?auto=compress&cs=tinysrgb&w=600",
#   prey: "Deer, Elk, Beavers",
#   predators: "Human, Grizzly Bear, Wolves, Jaguars",
#   habitat: "Forest and mountainous regions",
#   scientific_name: "Felis Concolor",
#   fun_fact: "Has no real natural predators!",
#   top_speed: "30 mph",
#   life_span: "10-20 years",
#   weight: "29-90kg (64-198lbs)",
#   diet: "Carnivore"
#     )

# Animal.create!(
#   name: "Corn Snake",
#   photo_url: "https://images.pexels.com/photos/15799789/pexels-photo-15799789.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
#   prey: "Rats, Mice, Baby birds, Eggs",
#   predators: "Hawks, Eagles, Foxes, other snakes, Coyotes, Bobcats",
#   habitat: "Forested areas, fields, swamps, hardwood hammocks, neighborhoods bordering habitat",
#   scientific_name: "P. guttatus",
#   fun_fact: "Corn snakes have scales on their backs that help them camouflage in leaf litter.",
#   top_speed: "18 mph",
#   life_span: "15 years in captivity, less in the wild",
#   weight: "29-90kg (64-198lbs)",
#   diet: "Carnivore"
#     )

# Animal.create!(
#   name: "Bobcat",
#   photo_url: "https://images.pexels.com/photos/11533125/pexels-photo-11533125.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
#   prey: "Rabbits, Deer, Birds, Mice",
#   predators: "Coyotes, Wolves, Mountain Lions, Alligators, Humans",
#   habitat: "Forests, swamps, deserts, and even urban areas",
#   scientific_name: "Lynx rufus",
#   fun_fact: "Bobcats are excellent climbers, can swim when they need to, and are about double the size of a domestica cat.",
#   top_speed: "34 mph",
#   life_span: "12-15 years",
#   weight: "4.1kg - 15.3g (9lbs - 33lbs)",
#   diet: "Carnivore"
# )
# db/seeds.rb
require 'csv'
# csv_text = File.read(Rails.root.join('db', 'new_test_animals.csv'))
# csv = CSV.parse(csv_text, headers: true)

# csv.each do |row|
#   Animal.create!(
#     name: row['name'],
#     scientific_name: row['scientific_name'],
#     photo_url: row['photo_url'],
#     # description: row['description'],
#     top_speed: row['top_speed'],
#     life_span: row['life_span'],
#     weight: row['weight'],
#     # height: row['height'],
#     # length: row['length'],
#     habitat: row['habitat'],
#     # predators: row['predators'],
#     # prey: row['prey'],
#     fun_fact: row['fun_fact'],
#     # animal_type: row['animal_type'],
#     diet: row['diet'],
#     park: row['park']
#   )
# end
# # Step 1: Create a park
csv_text = File.read(Rails.root.join('db', 'test_parks.csv')) # Adjust path to 'db'
park_csv = CSV.parse(csv_text, headers: true)

park_csv.each do |row|
  Park.create!(
    name: row['name'],
    location: row['location'],
    description: row['description'],
    annual_visitors: row['annual_visitors']
  )
end

rmnp = Park.create!(
  name: 'Rocky Mountain National Park',
  location: 'Colorado, USA',
  description: 'A beautiful national park known for its wildlife.',
  annual_visitors: '4.1 million visitors'
)

# # Step 2: Create animals and associate them with the park
csv_text = File.read(Rails.root.join('db', 'new_test_animals.csv')) # Adjust path to 'db'
csv = CSV.parse(csv_text, headers: true)
animals_by_name = {}

csv.each do |row|
  animal = Animal.create!(
    name: row['name'].singularize,
    photo_url: row['photo_url'],
    habitat: row['habitat'],
    scientific_name: row['scientific_name'],
    diet: row['diet'],
    top_speed: row['top_speed'],
    life_span: row['life_span'],
    weight: row['weight'],
    fun_fact: row['fun_fact']
  )

  # Associate with RMNP
  ParkAnimal.create!(park: rmnp, animal: animal)

  # Add animal to lookup hash for relationships
  animals_by_name[animal.name.downcase] = animal
end

# # Step 3: Add predator-prey relationships
csv.each do |row|
  animal = animals_by_name[row['name'].downcase]

  # Add predators
  if row['predators']
    predator_names = row['predators'].split(',').map { |name| name.singularize.strip }
    predator_names.each do |predator_name|
      predator = animals_by_name[predator_name.downcase]
      PredatorPreyRelation.find_or_create_by!(predator: predator, prey: animal) if predator
      # PredatorPreyRelation.create!(predator: predator, prey: animal) if predator
    end
  end

  # Add prey
  if row['prey']
    prey_names = row['prey'].split(',').map { |name| name.singularize.strip }
    prey_names.each do |prey_name|
      prey = animals_by_name[prey_name.downcase]
      PredatorPreyRelation.find_or_create_by!(predator: animal, prey: prey) if prey
      # PredatorPreyRelation.create!(predator: animal, prey: prey) if prey
    end
  end
end

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