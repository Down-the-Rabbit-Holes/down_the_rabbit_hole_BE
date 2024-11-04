require 'rails_helper'

RSpec.describe AnimalGateway do
  describe 'happy path' do
    it '#fetch_animal_data fetches animal facts', :vcr do
      animal_data = AnimalGateway.fetch_animal_data("Rabbit")

      expect(animal_data).to be_a Hash
      expect(animal_data[:name]).to eq("Rabbit")
      expect(animal_data[:characteristics][:main_prey]).to eq("Clover, Grass, Crunchy vegetables")
      expect(animal_data[:characteristics][:predators]).to eq("Foxes, wolves, bobcats, eagles, owls, coyotes")
      expect(animal_data[:characteristics][:habitat]).to eq("Forest thickets, meadows and woodland")
      expect(animal_data[:characteristics][:slogan]).to eq("There are more than 50 different species!")
      expect(animal_data[:characteristics][:top_speed]).to eq("2.4 mph")
      expect(animal_data[:characteristics][:lifespan]).to eq("4-9 years")
      expect(animal_data[:characteristics][:weight]).to eq("0.5-3kg (1.1-6.6lbs)")
      expect(animal_data[:characteristics][:diet]).to eq("Herbivore")
      expect(animal_data[:taxonomy][:scientific_name]).to eq("Oryctolagus cuniculus")
    end

    it '#fetch_animal_data fetches animal photo', :vcr do
      animal_pic = AnimalGateway.fetch_photo_data("Rabbit")

      expect(animal_pic).to be_a Hash
      expect(animal_pic[:photos]).to be_a Array
      expect(animal_pic[:photos].first[:url]).to include("https://www.pexels.com/photo/")
      expect(animal_pic[:photos].first[:src][:original]).to include("https://images.pexels.com/photos/")
      expect(animal_pic[:photos].last[:url]).to include("https://www.pexels.com/photo/")
      expect(animal_pic[:photos].last[:src][:original]).to include("https://images.pexels.com/photos/")
    end

    let(:animals) do
      [
        {
          name: "Rabbit",
          locations: ["test", "North-America"],
          characteristics: {
            habitat: "my front lawn",
            predators: ["corgis", "Humans"],
            prey: "grass",
            diet: "herbivore",
            top_speed: "10 mph",
            lifespan: "2-4 years",
            weight: "2 pounds",
            slogan: "test"
          }
        },
        {
          name: "Corgi",
          locations: ["Europe"],
          characteristics: {
            habitat: "behind you!!!!",
            predators: ["APEX PREDATOR"],
            prey: "my heart",
            diet: "nomnivore",
            top_speed: "42 mph",
            lifespan: "infinity :')",
            weight: "25 pounds",
            slogan: "test"
          }
        }
      ]
    end
    
    it '#valid_animal? checks if an animal object response has correct PORO attributes' do
      valid_animal = AnimalGateway.valid_animal?(animals)

      expect(valid_animal).to be_a Hash
      expect(valid_animal[:name]).to eq("Rabbit")
      expect(valid_animal[:name]).not_to eq("Corgi")
      expect(valid_animal[:locations]).to include("North-America")
      expect(valid_animal.dig(:characteristics, :habitat)).to eq("my front lawn")
      expect(valid_animal.dig(:characteristics, :slogan)).to eq("test")
    end
  end
end