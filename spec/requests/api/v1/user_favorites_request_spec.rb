require 'rails_helper'

RSpec.describe "UserFavorites", type: :request do
  describe "GET /index" do
    before(:each) do
      @user = User.create!(name: "test")
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

        UserFavorite.create!(user_id: @user.id, animal_id: @animal.id)
    end
    
    it '#get retrieves users and animals from joins table', :vcr do

      get "/api/v1/users/#{@user.id}/user_favorites"
      # , params: { user_id: user_id}
      # put response.inspect
      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed_body = JSON.parse(response.body)

      expect(parsed_body.first["name"]).to eq("Coyote")

    end
  end

  describe "POST /create" do
    
  end
end