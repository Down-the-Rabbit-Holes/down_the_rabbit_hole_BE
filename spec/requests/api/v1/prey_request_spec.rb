require 'rails_helper'

RSpec.describe "Prey", type: :request do
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
  end

  describe "GET /index HAPPY PATHS" do
    it 'returns the current animals prey' do
      get "/api/v1/animals/#{@rabbit.id}/prey"

      expect(response).to be_successful
      
      prey = JSON.parse(response.body, symbolize_names: true)[:data].first
   
      expect(prey[:attributes][:name]).to eq("grass")
    end
  end

  describe "GET /index SAD PATHS" do
    it "returns an error if the animal is not found" do
      get "/api/v1/animals/99999/prey"

      expect(response).to have_http_status(:not_found)

      error_message = JSON.parse(response.body, symbolize_names: true)[:error]
      expect(error_message).to eq("Animal not found")
    end
  end
end