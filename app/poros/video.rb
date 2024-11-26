class Video

  attr_reader :video_id, :title, :description, :thumbnail_url

  def initialize(video_data)
    @video_id = video_data[:id][:videoId]
    @title = video_data[:snippet][:title]
    @description = video_data[:snippet][:description]
    @thumbnail_url = video_data[:snippet][:thumbnails][:default][:url]
  end

end