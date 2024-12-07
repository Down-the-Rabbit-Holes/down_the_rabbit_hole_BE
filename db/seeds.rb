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

csv_text = File.read(Rails.root.join('db', 'csv', 'parks', 'test_parks.csv')) 
park_csv = CSV.parse(csv_text, headers: true)

park_csv.each do |row|
  Park.find_or_create_by!(
    name: row['name'],
    location: row['location'],
    description: row['description'],
    annual_visitors: row['annual_visitors']
  )
end

csv_text = File.read(Rails.root.join('db', 'csv', 'animals', 'current_animals_12_6.csv'))
csv = CSV.parse(csv_text, headers: true)
animals_by_name = {}

csv.each do |row|
  animal = Animal.find_or_create_by!(
    name: row['name'].singularize,
    scientific_name: row['scientific_name'],
    photo_url: row['photo_url'],
    description: row['description'],
    group_name: row['group_name'],
    baby_name: row['baby_name'],
    top_speed: row['top_speed'],
    life_span: row['life_span'],
    weight: row['weight'],
    height: row['height'],
    length: row['length'],
    habitat: row['habitat'],
    fun_fact: row['fun_fact'], 
    animal_type: row['animal_type'],
    diet: row['diet']
  )

  animals_by_name[animal.name.downcase] = animal

  if row['parks']
    park_names = row['parks'].split(',').map(&:strip) 
    park_names.each do |park_name|
      park = Park.find_by(name: park_name)
      if park
        ParkAnimal.find_or_create_by!(park: park, animal: animal)
      else
        puts "Warning: Park '#{park_name}' not found for animal '#{animal.name}'."
      end
    end
  end
end


csv.each do |row|
  animal = animals_by_name[row['name'].downcase]

  if row['predators']
    predator_names = row['predators'].split(',').map { |name| name.singularize.strip }
    predator_names.each do |predator_name|
      predator = animals_by_name[predator_name.downcase]
      PredatorPreyRelation.find_or_create_by!(predator: predator, prey: animal) if predator
    end
  end


  if row['prey']
    prey_names = row['prey'].split(',').map { |name| name.singularize.strip }
    prey_names.each do |prey_name|
      prey = animals_by_name[prey_name.downcase]
      PredatorPreyRelation.find_or_create_by!(predator: animal, prey: prey) if prey
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