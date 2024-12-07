require 'rails_helper'

RSpec.describe VideoGateway do
  describe 'happy path' do
    it '#fetch_video fetches a single video based on required api params', :vcr do
      video = VideoGateway.fetch_video("fox")

      expect(video).to be_a Hash
      expect(video[:id][:videoId]).to eq("YQA38wrB8I8")
      expect(video[:snippet][:title]).to eq("How To Draw A Cute Fox")
      expect(video[:snippet][:description]).to eq("Learn how to draw a cute fox! ART SUPPLIES we love (Amazon affiliate links): Sharpie Markers http://a.co/76TMEpK Printer ...")
      expect(video[:snippet][:thumbnails][:default][:url]).to eq("https://i.ytimg.com/vi/YQA38wrB8I8/default.jpg")
    end
  end
end