require 'rails_helper'

RSpec.describe "UserFavorites", type: :request do
  describe "GET /index" do
    before(:each) do
      @user = User.create!(name: "first_user")
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
    end

    it 'returns an error message if no favorites are found' do
      get "/api/v1/users/#{@user.id}/user_favorites"

      expect(response).to have_http_status(:not_found)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["error"]).to eq("No favorites yet")
    end
    
    it 'returns a list of favorited animals' do
      UserFavorite.create!(user_id: @user.id, animal_id: @rabbit.id)

      get "/api/v1/users/#{@user.id}/user_favorites"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed_body = JSON.parse(response.body)

      expect(parsed_body).to be_an(Array)
      expect(parsed_body.first["name"]).to eq("rabbit")
      expect(parsed_body.first["photo_url"]).to eq("http://example.com/rabbit.jpg")
      expect(parsed_body.first["habitat"]).to eq("forest")
      expect(parsed_body.first["fun_fact"]).to eq("Rabbits have 360-degree vision.")
      expect(parsed_body.first["top_speed"]).to eq("45 km/h")
      expect(parsed_body.first["life_span"]).to eq("9 years")
      expect(parsed_body.first["weight"]).to eq("2 kg")
      expect(parsed_body.first["diet"]).to eq("herbivore")
      expect(parsed_body.first["scientific_name"]).to eq("Oryctolagus cuniculus")
      expect(parsed_body.first["id"]).to eq(@rabbit.id)
    end
  end

  describe "POST /create" do
    before(:each) do
      @user = User.create!(name: "first_user")
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
    end

    it 'creates a new favorite' do
      post "/api/v1/users/#{@user.id}/user_favorites", params: { animal_id: @rabbit.id }

      expect(response).to have_http_status(:created)

      parsed_body = JSON.parse(response.body)

      expect(parsed_body["name"]).to eq("rabbit")
      expect(parsed_body["photo_url"]).to eq("http://example.com/rabbit.jpg")
      expect(parsed_body["habitat"]).to eq("forest")
      expect(parsed_body["fun_fact"]).to eq("Rabbits have 360-degree vision.")
      expect(parsed_body["top_speed"]).to eq("45 km/h")
      expect(parsed_body["life_span"]).to eq("9 years")
      expect(parsed_body["weight"]).to eq("2 kg")
      expect(parsed_body["diet"]).to eq("herbivore")
      expect(parsed_body["scientific_name"]).to eq("Oryctolagus cuniculus")
      expect(parsed_body["id"]).to eq(@rabbit.id)

      user_favorite = UserFavorite.find_by(user_id: @user.id, animal_id: @rabbit.id)
      
      expect(user_favorite).to be_a(UserFavorite)
      expect(user_favorite.user_id).to eq(@user.id)
      expect(user_favorite.animal_id).to eq(@rabbit.id)
    end

    it 'returns an error message if favorite cannot be saved' do
      UserFavorite.create!(user_id: @user.id, animal_id: @rabbit.id)

      post "/api/v1/users/#{@user.id}/user_favorites", params: { animal_id: @rabbit.id }

      expect(response).to have_http_status(:unprocessable_entity)

      parsed_body = JSON.parse(response.body)

      expect(parsed_body["error"]).to eq("Unable to save favorite")
    end
  end

  describe "DELETE /destroy" do
    before(:each) do
      @user = User.create!(name: "first_user")
      @animal = Animal.create!(
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

      @user_favorite = UserFavorite.create!(user_id: @user.id, animal_id: @animal.id)
    end

    it 'deletes a favorite' do
      expect(UserFavorite.count).to eq(1)
      delete "/api/v1/users/#{@user.id}/user_favorites/#{@animal.id}"
    
      expect(UserFavorite.count).to eq(0)
      expect(response).to have_http_status(:ok)

      parsed_body = JSON.parse(response.body)

      expect(parsed_body["message"]).to eq("Favorite removed")
    end

    it 'returns an error message if favorite is not found' do
      @user_favorite.destroy

      delete "/api/v1/users/#{@user.id}/user_favorites/#{@animal.id}"

      expect(response).to have_http_status(:not_found)

      parsed_body = JSON.parse(response.body)
      expect(parsed_body["error"]).to eq("Favorite not found")
    end
  end
end