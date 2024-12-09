require 'rails_helper'

RSpec.describe "Animals", type: :request do
  before(:each) do
    @rabbit = Animal.create!(
      name: "rabbit",
      photo_url: "http://example.com/rabbit.jpg",
      habitat: "forest",
      scientific_name: "Oryctolagus cuniculus",
      fun_fact: "Rabbits have 360-degree vision.",
      top_speed: "45 km/h",
      life_span: "9 years",
      weight: "2 kg",
      diet: "herbivore",
      description: "This is a rabbit",
      group_name: "Group of rabbits",
      baby_name: "bunny",
      height: "small",
      length: "also small",
      animal_type: "rabbit"
    )
    @grass = Animal.create!(
      name: "grass",
      photo_url: "http://example.com/rabbit.jpg",
      habitat: "forest",
      scientific_name: "grass",
      fun_fact: "grass",
      top_speed: "grass",
      life_span: "grass",
      weight: "grass",
      diet: "grass",
      description: "This is a grass",
      group_name: "Group of grass",
      baby_name: "grass",
      height: "small",
      length: "also small",
      animal_type: "grass"
    )
    @rabbit_prey = PredatorPreyRelation.create!(
      predator_id: @rabbit.id,
      prey_id: @grass.id
    )
    @fox = Animal.create!(
      name: "RED FOX",
      photo_url: "http://example.com/rabbit.jpg",
      habitat: "forest",
      scientific_name: "Oryctolagus cuniculus",
      fun_fact: "Rabbits have 360-degree vision.",
      top_speed: "45 km/h",
      life_span: "9 years",
      weight: "2 kg",
      diet: "herbivore",
      description: "This is a rabbit",
      group_name: "Group of rabbits",
      baby_name: "bunny",
      height: "small",
      length: "also small",
      animal_type: "RED FOX"
    )
    @rabbit_predator = PredatorPreyRelation.create!(
      predator_id: @fox.id,
      prey_id: @rabbit.id
    )
  end

  describe "GET /show & /relationships HAPPY PATHS" do
    it "returns one animal and all it's facts" do
      get "/api/v1/animals/#{@rabbit.id}"

      expect(response).to be_successful

      animal = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(animal[:attributes][:name]).to eq("rabbit")
    end
  end

    it 'returns the current animals prey' do
      get "/api/v1/animals/#{@rabbit.id}/relationships?prey=true"

      expect(response).to be_successful
      
      prey = JSON.parse(response.body, symbolize_names: true)[:data].first
   
      expect(prey[:attributes][:name]).to eq("grass")
    end

    it 'returns the current animals predators' do
      get "/api/v1/animals/#{@rabbit.id}/relationships?predators=true"

      expect(response).to be_successful
      
      prey = JSON.parse(response.body, symbolize_names: true)[:data].first
   
      expect(prey[:attributes][:name]).to eq("RED FOX")
    end

  describe "GET /show SAD PATHS" do
    it "returns an error if the animal is not found" do
      get "/api/v1/animals/99999"

      expect(response).to_not be_successful
      expect(response).to have_http_status(:not_found)

      error_message = JSON.parse(response.body, symbolize_names: true)[:error]
  
      expect(error_message).to eq("Animal not found")
    end
  end

  describe "GET /relationships SAD PATHS" do
    it "returns an error if the animal is not found" do
      get "/api/v1/animals/99999/relationships?prey=true" # Non-existent ID

      expect(response).to have_http_status(:not_found)

      error_message = JSON.parse(response.body, symbolize_names: true)[:error]
      expect(error_message).to eq("Animal not found")
    end

    it "returns an error if no valid filter is provided" do
      get "/api/v1/animals/#{@rabbit.id}/relationships" # No filter provided

      expect(response).to have_http_status(:bad_request)

      error_message = JSON.parse(response.body, symbolize_names: true)[:error]
      expect(error_message).to eq("No valid filter provided")
    end

    it "returns an error if an invalid filter is provided" do
      get "/api/v1/animals/#{@rabbit.id}/relationships?unknown=true" # Invalid filter

      expect(response).to have_http_status(:bad_request)

      error_message = JSON.parse(response.body, symbolize_names: true)[:error]
      expect(error_message).to eq("No valid filter provided")
    end
  end
end