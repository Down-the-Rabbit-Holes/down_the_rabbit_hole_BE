# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


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

csv_text = File.read(Rails.root.join('db', 'test_parks.csv')) 
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


csv_text = File.read(Rails.root.join('db', 'third_test_animals_csv.csv'))
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


  ParkAnimal.create!(park: rmnp, animal: animal)

 
  animals_by_name[animal.name.downcase] = animal
end


csv.each do |row|
  animal = animals_by_name[row['name'].downcase]

  if row['predators']
    predator_names = row['predators'].split(',').map { |name| name.singularize.strip }
    predator_names.each do |predator_name|
      predator = animals_by_name[predator_name.downcase]
      PredatorPreyRelation.find_or_create_by!(predator: predator, prey: animal) if predator
      # PredatorPreyRelation.create!(predator: predator, prey: animal) if predator
    end
  end


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