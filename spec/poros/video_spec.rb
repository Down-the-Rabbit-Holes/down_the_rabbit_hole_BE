require 'rails_helper'

RSpec.describe Video do
  describe "#initialize" do
    let(:video_data) do
      {
        id: { videoId: "12345" },
        snippet: {
          title: "How to Draw a test",
          description: "test",
          thumbnails: {
            default: { url: "http://example.com/test.jpg" }
          }
        }
      }
    end

    let(:video) { Video.new(video_data) }

    it 'initializes with correct attributes' do
      expect(video.video_id).to eq("12345")
      expect(video.title).to eq("How to Draw a test")
      expect(video.description).to eq("test")
      expect(video.thumbnail_url).to eq("http://example.com/test.jpg")
    end
  end

  describe '#to_json' do
    let(:video_data) do
      {
        id: { videoId: "12345" },
        snippet: {
          title: "How to Draw a test",
          description: "test",
          thumbnails: {
            default: { url: "http://example.com/test.jpg" }
          }
        }
      }
    end

    let(:video) { Video.new(video_data) }

    it 'returns JSON hash' do
      expect(video.to_json).to eq(
        {
          video_id: "12345",
          title: "How to Draw a test",
          description: "test",
          thumbnail_url: "http://example.com/test.jpg"
        }
      )
    end
  end
end