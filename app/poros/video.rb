class Video

  attr_reader :video_id, :title, :description, :thumbnail_url

  def initialize(video_data)
    @video_id = video_data.dig(:id, :videoId)
    @title = video_data.dig(:snippet, :title)
    @description = video_data.dig(:snippet, :description)
    @thumbnail_url = video_data.dig(:snippet, :thumbnails, :default, :url)
  end

  def to_json
    {
      video_id: video_id,
      title: title,
      description: description,
      thumbnail_url: thumbnail_url
    }
  end
end