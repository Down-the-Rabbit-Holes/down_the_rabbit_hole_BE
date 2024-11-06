require 'rails_helper'

RSpec.describe "Animals", type: :request do
  describe "GET /index" do
    it 'returns correct predators when param "eat_me" for proper prey occurs' do
      eat_params = { action_type: "eat_me", animal_name: "rabbit" }

      get "/api/v1/animals", params: eat_params

      expect(response).to be_successful

      # binding.pry
      animals = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(animals.size).to eq(1)
      animals.each do |animal|
        expect(animal).to have_key(:id)
        expect(animal[:attributes][:name]).to eq("Barred Owl")
        expect(animal[:attributes][:photo_url]).to eq("www.pexels.com/photo/brown-and-black-owl-staring-86596/")
        expect(animal[:attributes][:prey]).to eq("Mammals, including house mice and rabbits, other birds, amphibians, reptiles, insects and other invertebrates and even fish.")
        expect(animal[:attributes][:predators]).to eq("Raccoons, weasels, great horned owls, humans")
        expect(animal[:attributes][:habitat]).to eq("Forests, especially old growth forests near bodies of water, wooded swamps")
        expect(animal[:attributes][:fun_fact]).to eq("Barred owls are active during the day, which is unusual for owls.")
        expect(animal[:attributes][:top_speed]).to eq("30 mph")
        expect(animal[:attributes][:life_span]).to eq("18 years")
        expect(animal[:attributes][:weight]).to eq("Males weigh 1 to 1.8 pounds, females weigh about 1.8 to 2 pounds")
        expect(animal[:attributes][:diet]).to eq("Carnivore")
        expect(animal[:attributes][:scientific_name]).to eq("Strix varia")
      end
    end
  end

  describe 'POST /create' do
    # we are going for a big refactor here - do not test
    xit 'generates a start animal upon first game' do

      create_params = { animal: {action_type: "start", name: "rabbit" } }

      post "/api/v1/animals", params: create_params
      expect(response).to be_successful
      
      binding.pry
      animal = JSON.parse(response.body, symbolize_names: true)

      expect(animal[:data][:attributes][:name]).to eq("rabbit")
    end
  end
end