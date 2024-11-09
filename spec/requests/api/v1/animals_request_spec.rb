require 'rails_helper'

RSpec.describe "Animals", type: :request do
  before(:each) do
    @rabbit = Animal.create!(
      name: "rabbit",
      photo_url: "http://example.com/rabbit.jpg",
      prey: "grass",
      predators: "fox, wolf",
      habitat: "forest",
      scientific_name: "Oryctolagus cuniculus",
      diet: "herbivore",
      top_speed: "45 km/h",
      life_span: "9 years",
      weight: "2 kg",
      fun_fact: "Rabbits have 360-degree vision."
    )
  end

  describe "GET /index HAPPY PATHS" do
    it 'returns correct predators when param="eat_me"', :vcr do
      eat_params = { action_type: "eat_me", animal_name: "rabbit" }

      get "/api/v1/animals", params: eat_params

      expect(response).to be_successful

      animals = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(animals.size).to eq(2)
      expect(animals.first[:attributes][:prey]).to include("hares")
      expect(animals.last[:attributes][:prey]).to include("Elk")
    end
  end

    it 'returns selected animal when param="selected_animal" OR "start"', :vcr do
      selected_params = { action_type: "selected_animal", name: "rabbit" }

      get "/api/v1/animals", params: selected_params

      expect(response).to be_successful

      selected_animal = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(selected_animal[:attributes][:name]).to eq("rabbit")
    end

 

  describe "GET /index SAD PATHS" do
    it 'returns error if animal not on DB when params="start"||"selected_animal"' do
    
      selected_params = { action_type: "selected_animal", name: "corgi" }

      get "/api/v1/animals", params: selected_params

      expect(response).to have_http_status(:not_found)

      missing_animal = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(missing_animal).to eq("Animal not found")
    end
  end
end