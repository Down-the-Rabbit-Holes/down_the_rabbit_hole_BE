require 'rails_helper'

RSpec.describe "Videos", type: :request do
  describe "GET/#show" do
    it 'returns a YT video based on an animals name', :vcr do
      get "/api/v1/animals/videos?name=wolf"

      expect(response).to be_successful
      video = JSON.parse(response.body, symbolize_names: true)

      expect(video[:video_id]).to eq("6nQBMmyVspA")
      expect(video[:title]).to eq("How To Draw A Realistic Wolf")
      expect(video[:description]).to eq("Learn how to draw a realistic wolf! Grab a marker, paper, and two colored pencils (grey and black) then follow along with me.")
      expect(video[:thumbnail_url]).to eq("https://i.ytimg.com/vi/6nQBMmyVspA/default.jpg")
    end

    it 'returns error if video object not instantiated/found', :vcr do
      get "/api/v1/animals/videos?name=afakenonexistenttestanimal"

      expect(response).to have_http_status(404)

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key(:error)
      expect(error_response[:error]).to eq("Video not found")
    end
  end
end