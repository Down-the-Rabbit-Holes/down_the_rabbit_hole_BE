require 'rails_helper'

RSpec.describe "UserFavorites", type: :request do
  describe "GET /index" do
    before(:each) do
      @user = User.create!(name: "first_user")
      @animal = Animal.create!(
        name: "Coyote", 
        photo_url: "www.pexels.com/photo/two-playful-coyotes-27067820/", 
        prey: "Rabbit, Mice, Deer",
        predators: "Human, Bears, Wolves, Great horned owls, Bald Eagles", 
        habitat: "Forests, plains and deserts",
        fun_fact: "Also known as the Prairie Wolf!",
        top_speed: "40 miles per hour",
        life_span: "10 - 15 years",
        weight: "7kg - 21kg (15lbs - 46lbs)",
        diet: "Carnivore",
        scientific_name: "Canis latrans"
        )
    end

    it 'returns an error message if no favorites are found' do
      get "/api/v1/users/#{@user.id}/user_favorites"

      expect(response).to have_http_status(:not_found)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["error"]).to eq("No favorites yet")
    end
    
    it 'returns a list of favorited animals' do
        UserFavorite.create!(user_id: @user.id, animal_id: @animal.id)

        get "/api/v1/users/#{@user.id}/user_favorites"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        parsed_body = JSON.parse(response.body)

        expect(parsed_body).to be_an(Array)
        expect(parsed_body.first["name"]).to eq("Coyote")
        expect(parsed_body.first["photo_url"]).to eq("www.pexels.com/photo/two-playful-coyotes-27067820/")
        expect(parsed_body.first["prey"]).to eq("Rabbit, Mice, Deer")
        expect(parsed_body.first["predators"]).to eq("Human, Bears, Wolves, Great horned owls, Bald Eagles")
        expect(parsed_body.first["habitat"]).to eq("Forests, plains and deserts")
        expect(parsed_body.first["fun_fact"]).to eq("Also known as the Prairie Wolf!")
        expect(parsed_body.first["top_speed"]).to eq("40 miles per hour")
        expect(parsed_body.first["life_span"]).to eq("10 - 15 years")
        expect(parsed_body.first["weight"]).to eq("7kg - 21kg (15lbs - 46lbs)")
        expect(parsed_body.first["diet"]).to eq("Carnivore")
        expect(parsed_body.first["scientific_name"]).to eq("Canis latrans")
        expect(parsed_body.first["id"]).to eq(@animal.id)
    end
  end

  describe "POST /create" do
    before(:each) do
      @user = User.create!(name: "first_user")
      @animal = Animal.create!(
        name: "Coyote", 
        photo_url: "www.pexels.com/photo/two-playful-coyotes-27067820/", 
        prey: "Rabbit, Mice, Deer",
        predators: "Human, Bears, Wolves, Great horned owls, Bald Eagles", 
        habitat: "Forests, plains and deserts",
        fun_fact: "Also known as the Prairie Wolf!",
        top_speed: "40 miles per hour",
        life_span: "10 - 15 years",
        weight: "7kg - 21kg (15lbs - 46lbs)",
        diet: "Carnivore",
        scientific_name: "Canis latrans"
        )
    end

    it 'creates a new favorite' do
      post "/api/v1/users/#{@user.id}/user_favorites", params: { animal_id: @animal.id }

      expect(response).to have_http_status(:created)

      parsed_body = JSON.parse(response.body)

      expect(parsed_body["name"]).to eq("Coyote")
      expect(parsed_body["photo_url"]).to eq("www.pexels.com/photo/two-playful-coyotes-27067820/")
      expect(parsed_body["prey"]).to eq("Rabbit, Mice, Deer")
      expect(parsed_body["predators"]).to eq("Human, Bears, Wolves, Great horned owls, Bald Eagles")
      expect(parsed_body["habitat"]).to eq("Forests, plains and deserts")
      expect(parsed_body["fun_fact"]).to eq("Also known as the Prairie Wolf!")
      expect(parsed_body["top_speed"]).to eq("40 miles per hour")
      expect(parsed_body["life_span"]).to eq("10 - 15 years")
      expect(parsed_body["weight"]).to eq("7kg - 21kg (15lbs - 46lbs)")
      expect(parsed_body["diet"]).to eq("Carnivore")
      expect(parsed_body["scientific_name"]).to eq("Canis latrans")
      expect(parsed_body["id"]).to eq(@animal.id)

      user_favorite = UserFavorite.find_by(user_id: @user.id, animal_id: @animal.id)
      expect(user_favorite).to be_a(UserFavorite)
      expect(user_favorite.user_id).to eq(@user.id)
      expect(user_favorite.animal_id).to eq(@animal.id)
    end

    it 'returns an error message if favorite cannot be saved' do
      UserFavorite.create!(user_id: @user.id, animal_id: @animal.id)

      post "/api/v1/users/#{@user.id}/user_favorites", params: { animal_id: @animal.id }

      expect(response).to have_http_status(:unprocessable_entity)

      parsed_body = JSON.parse(response.body)

      expect(parsed_body["error"]).to eq("Unable to save favorite")

    end
  end
end