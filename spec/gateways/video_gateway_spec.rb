require 'rails_helper'

RSpec.describe VideoGateway do
  describe 'happy path' do
    it '#fetch_video fetches a single video based on required api params', :vcr do
      video_obj = VideoGateway.fetch_video("fox")

      expect(video_obj).to be_a Video
      expect(video_obj.video_id).to eq("YQA38wrB8I8")
      expect(video_obj.title).to eq("How To Draw A Cute Fox")
      expect(video_obj.description).to eq("Learn how to draw a cute fox! ART SUPPLIES we love (Amazon affiliate links): Sharpie Markers http://a.co/76TMEpK Printer ...")
      expect(video_obj.thumbnail_url).to eq("https://i.ytimg.com/vi/YQA38wrB8I8/default.jpg")
    end
  end
end