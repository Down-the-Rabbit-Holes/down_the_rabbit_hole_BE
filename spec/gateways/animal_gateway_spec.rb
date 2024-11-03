require 'rails_helper'

RSpec.describe AnimalGateway do
  describe 'happy path' do
    it '#fetch_animal_data for animal facts', :vcr do
      animal_data = AnimalGateway.fetch_animal_data("rabbit")

      expect(animal_data).to be_a Hash
      expect(animal_data[:name]).to eq("Jackrabbit")
      # expect(animal_data[:photo_url]).to eq(nil)
      expect(animal_data[:characteristics][:prey]).to eq("Grass, twigs, bark")
      expect(animal_data[:characteristics][:predators]).to eq("coyotes, red-tailed hawks, bobcats")
      expect(animal_data[:characteristics][:habitat]).to eq("Desert, savanna, grassland")
      expect(animal_data[:characteristics][:slogan]).to eq("There are more than 50 different species!")
      expect(animal_data[:characteristics][:top_speed]).to eq("18 miles per hour")
      expect(animal_data[:characteristics][:life_span]).to eq("4-9 years")
      expect(animal_data[:characteristics][:weight]).to eq("0.5-3kg (1.1-6.6lbs)")
      expect(animal_data[:characteristics][:diet]).to eq("Herbivore")
      expect(animal_data[:characteristics][:scientific_name]).to eq("oryctolagus cuniculus")
    end

    it '#fetch_animal_data for animal photo', :vcr do

    end
  end
end