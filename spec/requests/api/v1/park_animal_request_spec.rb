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
    @park = Park.create!(name: "Park", location: "Somewhere", description: "Beautiful", annual_visitors: "A lot!")
    @park_amimal = ParkAnimal.create!(park_id: @park.id, animal_id: @rabbit.id)
  end

  describe "GET /index HAPPY PATHS" do
    it "returns all animals for a specific park" do
      get "/api/v1/park_animals/#{@park.id}"

      expect(response).to be_successful
      
      animal = JSON.parse(response.body, symbolize_names: true)[:data].first

      expect(animal[:attributes][:name]).to eq("rabbit")
    end
  end

  describe "GET /index SAD PATHS" do
    it "returns an error if the park ID is incorrect" do
      get "/api/v1/park_animals/99999"

      expect(response).to_not be_successful
      expect(response).to have_http_status(:not_found)
  
      error_message = JSON.parse(response.body, symbolize_names: true)[:error]
  
      expect(error_message).to eq("Park not found")
    end
  end
end