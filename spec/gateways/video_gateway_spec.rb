require 'rails_helper'

RSpec.describe VideoGateway do
  describe 'happy path' do
    it '#fetch_video fetches a single video based on required api params', :vcr do
      video_data = VideoGateway.fetch_video("fox")

      expect(video_data).to be_a Hash
      expect(video_data[:id][:videoId]).to eq("YQA38wrB8I8")
      expect(video_data[:snippet][:title]).to eq("How To Draw A Cute Fox")
      expect(video_data[:snippet][:description]).to eq("Learn how to draw a cute fox! ART SUPPLIES we love (Amazon affiliate links): Sharpie Markers http://a.co/76TMEpK Printer ...")
      expect(video_data[:snippet][:thumbnails][:default][:url]).to eq("https://i.ytimg.com/vi/YQA38wrB8I8/default.jpg")
    end
  end
end