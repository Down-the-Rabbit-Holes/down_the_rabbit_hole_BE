class Video

  attr_reader :video_id, :title, :description, :thumbnail_url

  def initialize(vid_data)
    @video_id = vid_data[:id][:videoId]
    @title = vid_data[:snippet][:title]
    @description = vid_data[:snippet][:description]
    @thumbnail_url = vid_data[:snippet][:thumbnails][:default][:url]
  end

end