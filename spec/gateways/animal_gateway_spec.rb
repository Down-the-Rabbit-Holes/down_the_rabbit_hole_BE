require 'rails_helper'

RSpec.describe AnimalGateway do
  describe 'happy path' do
    it '#fetch_animal_data for animal facts', :vcr do
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

    it '#fetch_animal_data for animal photo', :vcr do

    end
  end
end